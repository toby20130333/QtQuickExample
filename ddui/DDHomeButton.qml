import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id:btnRect
    width: 100
    height: 100
    color: "transparent"
    property url btnUrl: "http://download.easyicon.net/png/1194626/72/"
    property string btnTxt: "Home"
    property bool systemBtn: false
    signal signalBtnClicked(string btn);
    MouseArea{
        id:ma
        anchors.fill: btnRect
        hoverEnabled: true
        onClicked: {
            signalBtnClicked(btnTxt);
        }
        onEntered: {
            icon.opacity=0.8;
            btnRect.color="#00CBEF"
            btnRect.border.width= !systemBtn?1:0
            btnRect.radius =  !systemBtn?3:0;
            btnRect.border.color="#009AD3";
        }
        onExited: {
            icon.opacity=1.0
            btnRect.radius = 0;
            btnRect.color="transparent"
            btnRect.border.width=0
            btnRect.border.color="transparent";
        }
    }
    Image {
        id: icon
        width: !systemBtn?btnRect.width*0.72:parent.width
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        source: btnUrl
    }
    Text {
        id: btntext
        anchors.horizontalCenter: parent.horizontalCenter
        width:  !systemBtn?btnRect.width*0.72:0
        anchors.bottom: parent.bottom
        text: btnTxt
        height:  !systemBtn?btnRect.width*0.28:0
        visible: !systemBtn
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pixelSize: 14
    }
}
