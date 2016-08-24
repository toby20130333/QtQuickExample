import QtQuick 2.0
import "./common/" as Common

Item {

    Common.DDImage {
        id: logo
        source: "qrc:/images/360/main/dl_logo.png"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 6
    }
    Common.DDText{
        id:textId
        anchors.left: logo.right
        anchors.leftMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 6
        color: "white"
        text: "QtQuick协助360安全卫士领航版"
        font.pixelSize:12
    }
    Common.CustomButton {
        id: updateImg
        btnurl: "qrc:/images/360/main/update_btn.png"
        anchors.left: textId.right
        anchors.leftMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 6
        framewidth : 68/framecount
        frameheight: 17//
        clickType: 8
        onSignalClickedBtn: {
            //signalQmlOptions("close app","system");
        }
    }
    Common.CustomButton  {
        id:mdalBtn
        anchors.right: shareBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 96/framecount
        frameheight: 32//
        clickType: 1
        btnurl: "qrc:/images/360/main/MedalUnLight2.png"
        onSignalClickedBtn: {
            //signalQmlOptions("close app","system");
        }
    }
    Common.CustomButton  {
        id:shareBtn
        anchors.right: skinBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 116/framecount
        frameheight: 24//qrc:/images/360/main/MedalUnLight2.png
        clickType: 6
        btnurl: "qrc:/images/360/main/share_weibo_icon.png"
        onSignalClickedBtn: {
            //signalQmlOptions("close app","system");
        }
    }
    Common.CustomButton  {
        id:skinBtn
        anchors.right: feedBackBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 116/framecount
        frameheight: 24
        clickType: 5
        btnurl: "qrc:/images/360/main/Skin.png"
        onSignalClickedBtn: {
            //signalQmlOptions("close app","system");
        }
    }
    Common.CustomButton  {
        id:feedBackBtn
        anchors.right: menuBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 108/framecount
        frameheight: 22
        clickType: 4
        btnurl: "qrc:/images/360/main/feedback.png"
        onSignalClickedBtn: {
            //signalQmlOptions("close app","system");
        }
    }
    Common.CustomButton  {
        id:menuBtn
        anchors.right: minBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 116/framecount
        clickType: 3
        btnurl: "qrc:/images/360/main/menu.png"
        onSignalClickedBtn: {
            signalQmlOptions("system","menu");
        }
    }
    Common.CustomButton  {
        id:minBtn
        anchors.right: closeBtn.left
        anchors.top:parent.top
        anchors.rightMargin: 0
        framewidth : 116/framecount
        clickType: 2
        btnurl: "qrc:/images/360/main/min.png"
        onSignalClickedBtn: {
            signalQmlOptions("system","min");
        }
    }
    Common.CustomButton  {
        id:closeBtn
        anchors.right: parent.right
        anchors.top:parent.top
        anchors.rightMargin: 0
        onSignalClickedBtn: {
            signalQmlOptions("system","close");
        }
    }
}
