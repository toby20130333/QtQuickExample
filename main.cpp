#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ddview.h"
#include "ddquickview.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

#if 1
    YbQuickView view;
    view.setFlags(Qt::FramelessWindowHint|Qt::Window);
    view.setHasMouse(false);
#ifdef USE_YOUZAN
    view.setMaximumWidth(500);
    view.setMaximumHeight(460);
#ifdef Q_OS_MACX
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("../../../youzan/main.qml"));
#else
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("youzan/main.qml"));
#endif
#elif USE_DRIVER
#ifdef Q_OS_MACX
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("../../../Driver/DDDriverView.qml"));
#else
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Driver/DDDriverView.qml"));
#endif

#elif USE_360UI
    view.setMaximumWidth(500);
    view.setMaximumHeight(460);
#ifdef Q_OS_MACX
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("../../../360/360mainview.qml"));
#else
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("360/360mainview.qml"));
#endif

#else
    view.setSourceAndRegsiterObj(QUrl::fromLocalFile("XunLei/DDXunLei.qml"));
#endif
    view.show();
    view.setCanMoveRange(QPoint(view.width(),50));
#else

    QQuickView *views = new QQuickView;
    views->setFlags(Qt::FramelessWindowHint|Qt::Window);;
    views->setSource(QUrl::fromLocalFile("youzan/main.qml"));
    views->show();
#endif
    return app.exec();
}
