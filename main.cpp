#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFont>

#include "ddui/ddview.h"
#include "ddui/ddquickview.h"
#include "ddui/ddnewquickwindow.h"

#define USE_NEW_WINDOW 1

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QApplication::setQuitOnLastWindowClosed(false);
    QFont font;
    font.setFamily("Microsoft YaHei");
    font.setPixelSize(12);
    app.setFont(font);
#ifdef USE_NEW_WINDOW
    YbQuickView view;
    view.setFlags(Qt::FramelessWindowHint|Qt::Window);
    view.setHasMouse(false);
#ifndef QT_NO_DEBUG
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Driver/DDDriverView.qml"));
#else
    view.setSourceAndRegsiterObj(QUrl("qrc:/Driver/DDDriverView.qml"));
#endif
    view.showTrayIcon();
    view.show();
    view.setCanMoveRange(QPoint(view.width(),50));
#else

    DDNewQuickWindow window;
    window.setFlags(Qt::FramelessWindowHint|Qt::Window);
    window.setSourceAndRegsiterObj(QUrl::fromLocalFile("Poetry/DDPoeTryPage.qml"));
    window.show();
    window.showTrayIcon();
#endif
    return app.exec();
}
