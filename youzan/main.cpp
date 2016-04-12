#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "youzanapi.h"
#include "youzanobject.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    YouZanObject yZObj;
    engine.rootContext()->setContextProperty("yzObj", &yZObj);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    YouZanApi api;
//    api.initData("2016-03-09 00:00:00","2016-05-09 00:00:00");
    return app.exec();
}
