TEMPLATE = app

QT += qml quick printsupport

SOURCES += main.cpp \
#    ddview.cpp \
    ddquickview.cpp \
    youzan/youzanapi.cpp \
    youzan/youzanobject.cpp

RESOURCES += qml.qrc \
                          youzan/qml.qrc \
    imgqrc.qrc \
    360/360.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

MOC_DIR =./tmp/moc
UI_DIR = ./tmp/ui
OBJECTS_DIR = ./tmp/obj

DEFINES += USE_360UI
win32:{
    RC_FILE += 360.rc
}
# Default rules for deployment.
include(deployment.pri)

HEADERS += \
#    ddview.h \
    ddquickview.h \
    youzan/youzanapi.h \
    youzan/youzanobject.h
