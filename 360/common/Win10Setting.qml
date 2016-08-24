import QtQuick 2.0

Item {
    id:root
    property string mainTitle: "Win10设置"
    property string subTitle: "一键助您顺畅驾驭Win10"
    Column{
        anchors.right:win10Img.left
        anchors.rightMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 12
        height: parent.height
        spacing: 2

        DDText{
            id:mainTxt
            text: mainTitle
            width: root.width*3/4
            height: 18
            font.pixelSize: 12
            color: "black"
            font.letterSpacing: 2
            horizontalAlignment: Text.AlignRight

        }

        DDText{
            id:subTxt
            text:subTitle
            font.pixelSize: 12
            color: "grey"
            horizontalAlignment: Text.AlignRight
            width: root.width*3/4
        }
    }
    DDImage{
        id:win10Img
        source: "qrc:/images/360/main/win10.png"
        anchors.right: parent.right
        height: sourceSize.height
        anchors.verticalCenter: parent.verticalCenter
    }
}
