TEMPLATE = app

QT += qml quick widgets network
qtHaveModule(printsupport): QT += printsupport
SOURCES += main.cpp \
    youzanapi.cpp \
    youzanobject.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)


HEADERS += \
    youzanapi.h \
    youzanobject.h
