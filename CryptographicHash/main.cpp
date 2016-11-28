#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QObject>
#include "backend.h"
#include <QClipboard>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    Backend *Obj = new Backend();
    QClipboard *cp = QGuiApplication::clipboard();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QQmlContext *ctx = engine.rootContext ();
    ctx->setContextProperty ("obj",Obj);
    return app.exec();
}
