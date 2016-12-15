#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ddui/ddview.h"
#include "ddui/ddquickview.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    YbQuickView view;
    view.setFlags(Qt::FramelessWindowHint|Qt::Window);
    view.setHasMouse(false);
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Driver/DDDriverView.qml"));
    view.show();
    view.setCanMoveRange(QPoint(view.width(),50));
    return app.exec();
}
