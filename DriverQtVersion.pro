TEMPLATE = app

QT += qml quick printsupport

SOURCES += main.cpp \
#    ddview.cpp \
    ddui/ddquickview.cpp \
    youzan/youzanapi.cpp \
    youzan/youzanobject.cpp \
    model/bdtablemodel.cpp

RESOURCES += qml.qrc imgqrc.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

MOC_DIR =./tmp/moc
UI_DIR = ./tmp/ui
OBJECTS_DIR = ./tmp/obj

DEFINES += USE_DRIVER
win32:{
    RC_FILE += 360.rc
}
# Default rules for deployment.
include(deployment.pri)
#include(systemtrayicon/systemtrayicon.pri)

HEADERS += \
#    ddview.h \
    ddui/ddquickview.h \
    youzan/youzanapi.h \
    youzan/youzanobject.h \
    model/bdtablemodel.h
