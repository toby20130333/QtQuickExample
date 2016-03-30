TEMPLATE = app

QT += qml quick

SOURCES += main.cpp \
    ddview.cpp \
    ddquickview.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ddview.h \
    ddquickview.h
