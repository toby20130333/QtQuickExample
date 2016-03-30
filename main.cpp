#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("XunLei/DDXunLei.qml")));
    engine.load(QUrl(QStringLiteral("main.qml")));

    return app.exec();
}
