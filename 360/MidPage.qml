import QtQuick 2.0
import "./common" as Common

Item {
    MidChangePart{
        id:changedPart
        width: parent.width
        height: parent.height*4/5
    }

    Row{
        anchors.left:parent.left
        anchors.leftMargin: 25
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        spacing: 20
        height: parent.height/5
        width: parent.width/2
        Common.SigleButton{
            id:safeIndicator
            btmTitle: "安全防护中心"
        }
        Common.DDImage{
            source: "qrc:/images/360/main/v_line.png"
            height: parent.height*2/3
            anchors.verticalCenter: parent.verticalCenter
        }
        Common.SigleButton{
            id:shopping
            btnurl: "qrc:/images/360/main/payinsure_safe_"
            btmTitle: "网购先赔"
        }
    }
}
