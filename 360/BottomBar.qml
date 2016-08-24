import QtQuick 2.0
import "./common" as Common

Rectangle {
    height: 162
    width: parent.width
    color: "white"

    Row{
        anchors.left: parent.left
        anchors.leftMargin: 30
        width: parent.width*2/5
        height: parent.height
        spacing: 20
        Common.AnimationButton{
            framecount: 10
            framewidth: 950/framecount
            frameheight: 95
            btnurl: "qrc:/images/360/btm/shamuma_new_Anima_Hover.png"
            anchors.verticalCenter: parent.verticalCenter
            btmTitle: "查杀修复"
        }

        Common.AnimationButton{
            framecount: 10
            framewidth: 950/framecount
            frameheight: 95
            btnurl: "qrc:/images/360/btm/qinglilaji_yijianqingli_Anima_Hover.png"
            anchors.verticalCenter: parent.verticalCenter
            btmTitle: "电脑清理"
        }

        Common.AnimationButton{
            framecount: 10
            framewidth: 950/framecount
            frameheight: 95
            btnurl: "qrc:/images/360/btm/youhuajiasu_Anima_Hover.png"
            anchors.verticalCenter: parent.verticalCenter
            btmTitle: "加速优化"
        }
    }


    Common.Win10Setting{
        id:win10Id
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: parent.width/4
        height: parent.height/2-20
    }
        Common.SigleButton{
            id:safeIndicator
            btmTitle: "软件管家"
            txtColor:"grey"
            anchors.right: safeIndicator2.left
            anchors.rightMargin: 20
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            btnurl: "qrc:/images/360/main/jjx_winpe_normal.png"
            reallysigle:true
        }
        Common.SigleButton{
            id:safeIndicator2
            btmTitle: "图表"
            txtColor:"grey"
            anchors.right: safeIndicator3.left
            anchors.rightMargin: 20
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            btnurl: "qrc:/images/360/main/chart_48.png"
            reallysigle:true
        }
        Common.SigleButton{
            id:safeIndicator3
            btmTitle: "Qt助手"
            txtColor:"grey"
            anchors.right: safeIndicator4.left
            anchors.rightMargin: 20
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            btnurl: "qrc:/images/360/main/assistant_qt.png"
            reallysigle: true
        }
        Common.SigleButton{
            id:safeIndicator4
            btmTitle: "AD助手"
            txtColor:"grey"
            anchors.right: safeIndicator5.left
            anchors.rightMargin: 20
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            btnurl: "qrc:/images/360/main/android_48.png"
            reallysigle: true
        }
        Common.DDImage{
            id:safeIndicator5
//            height: safeIndicator.height
            anchors.right: parent.right
            anchors.rightMargin: 10
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            source: "qrc:/images/360/main/more.png"
        }
//    }

}
