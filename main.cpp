#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ddview.h"
#include "ddquickview.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    YbQuickView view;
    view.setFlags(Qt::FramelessWindowHint);
    view.setHasMouse(false);
//    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Driver/DDDriverView.qml"));
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("XunLei/DDXunLei.qml"));

    view.show();
    return app.exec();
}
