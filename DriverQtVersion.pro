TEMPLATE = app

QT += qml quick printsupport

SOURCES += main.cpp \
    ddview.cpp \
    ddquickview.cpp \
    youzan/youzanapi.cpp \
    youzan/youzanobject.cpp

RESOURCES += qml.qrc \
                          youzan/qml.qrc \
    imgqrc.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

MOC_DIR =./tmp/moc
UI_DIR = ./tmp/ui
OBJECTS_DIR = ./tmp/obj

DEFINES += USE_YOUZAN

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ddview.h \
    ddquickview.h \
    youzan/youzanapi.h \
    youzan/youzanobject.h
