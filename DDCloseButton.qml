import QtQuick 2.1

Rectangle{
    id:closeBtn
    width: 32
    height: width
    property bool hasMouse: false
    color:hasMouse?"#D44027": "transparent"
    signal signalCloseApp();
    MouseArea{
        id:ma
        anchors.fill: closeBtn
        hoverEnabled: true
        onClicked: {
            signalCloseApp();
        }
        onEntered: {
            closeBtn.hasMouse = true;
        }
        onExited: {
            closeBtn.hasMouse = false;
        }
    }
    Text {
        id: btntext
        anchors.fill: parent
        text: "X"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color:closeBtn.hasMouse?"white": "grey"
        font.pixelSize: 18
    }
}
