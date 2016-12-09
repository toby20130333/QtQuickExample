import QtQuick 2.1
import QtQuick.Controls 1.0
import "./common" as Common

Item {
    property string mainTitle: "使用<font color='red'>QtQuick</font>开发,让您更酷炫"
    property string subTitle: "建议下载360杀毒，防护更全面，电脑更安全"
    signal changePageTo(int cmd)

    ProgressBar {
        id:progressBar
        anchors.left: parent.left
        anchors.leftMargin: 36
        anchors.top: parent.top
        anchors.topMargin: 36
        value: 0.88
        width:168
        height:width
        style:Common.CustomProgressBar{
        }
    }

    Column{
        anchors.left:progressBar.right
        anchors.leftMargin: 35
        anchors.top: parent.top
        anchors.topMargin: 36+progressBar.height/4
        spacing: 4

        Common.DDText{
            id:mainTxt
            text: mainTitle
            font.pixelSize: 30
            color: "white"
            font.letterSpacing: 2

        }

        Common.DDText{
            id:subTxt
            text:subTitle
            font.pixelSize: 14
            color: "white"
        }
    }

    Common.CustomButton {
        id: updateImg
        btnurl: "qrc:/images/360/main/btn_view_detail.png"
        framewidth : 848/framecount
        frameheight: 74//
        framecount: 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        clickType: 11
        onSignalClickedBtn: {
            changePageTo(clickType);
            //signalQmlOptions("close app","system");
        }
    }
}
