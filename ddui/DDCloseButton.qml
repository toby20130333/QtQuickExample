import QtQuick 2.1

Rectangle{
    id:closeBtn
    width: 27
    height: 22
    property bool hasMouse: false
    property string statusN: ""
    property string imgUrl: "images/close"+statusN+".png"
    color:hasMouse?"#D44027": "transparent"
    signal signalCloseApp();
    MouseArea{
        id:ma
        anchors.fill: closeBtn
        hoverEnabled: true
        onClicked: {
            statusN = "_pressed";
            signalCloseApp();
        }
        onEntered: {
            statusN = "_hover"
            closeBtn.hasMouse = true;
        }
        onExited: {
            statusN = "";
            closeBtn.hasMouse = false;
        }
    }
    Image {
        id: btntext
        anchors.fill: parent
        source: imgUrl
    }
}
