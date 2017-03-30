#include <QApplication>
#include <QQmlApplicationEngine>
#include "ddui/ddview.h"
#include "ddui/ddquickview.h"
#include <systemtrayicon/bdsystemtrayicon.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QApplication::setQuitOnLastWindowClosed(false);
    YbQuickView view;
    view.setFlags(Qt::FramelessWindowHint|Qt::Window);
    view.setHasMouse(false);
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Driver/DDDriverView.qml"));
    view.showTrayIcon();
    view.show();
    view.setCanMoveRange(QPoint(view.width(),50));
    return app.exec();
}
