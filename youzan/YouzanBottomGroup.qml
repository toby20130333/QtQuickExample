import QtQuick 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 1.2
import "./youzan.js" as YSTHEME

Item {
    width: 100
    height: 30
    signal signalClickBtn(int itype);

    Button {
        anchors.left: parent.left
        width:100
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                color: "#12AADF"
            }
            label:Label {
                text: "设置当前时间"
                font.pixelSize: YSTHEME.textFontSize
                font.family: YSTHEME.textfontfamily
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: YSTHEME.textWhiteColor
            }
        }
        onClicked: {
            signalClickBtn(0);
        }
    }
    Button {
        anchors.right: parent.right
        width:80
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                color: "#12AADF"
            }
            label:Label {
                text: "确 定"
                font.pixelSize: YSTHEME.textFontSize+2
                font.family: YSTHEME.textfontfamily
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: YSTHEME.textWhiteColor
            }
        }
        onClicked: {
            signalClickBtn(1);
        }
    }
}

