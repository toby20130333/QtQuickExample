import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

import "./youzan.js" as YSTHEME
Item {
    width: 100
    height: 20
    property string txt: "小时"
    property int maxValue: 23
    property int minValue: 0

    signal signalSliderValueChanged(string valueId);

    Text {
        id: txtId
        text: txt
        height: parent.height
        width: parent.width/9
        color: YSTHEME.textBlackColor
        font.family: YSTHEME.textfontfamily
    }
    Slider {
        id:sliderId
        anchors.left: txtId.right
        anchors.leftMargin: 2
        value: 0.0
        height: parent.height
        width: parent.width*8/9
        maximumValue: maxValue
        minimumValue: minValue
        style: SliderStyle{
            groove: Rectangle {
                implicitWidth: 200
                implicitHeight: 8
                color: YSTHEME.btn_color
                radius: 8
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "lightgray"
                border.color: "gray"
                border.width: 1
                implicitWidth: 20
                implicitHeight: 20
                x: control.leftPadding + (horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
                y: control.topPadding + (horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
                radius: implicitHeight/2
                readonly property bool horizontal: control.orientation === Qt.Horizontal
            }
            //            handle: Rectangle {
            //                x: control.leftPadding + (horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
            //                y: control.topPadding + (horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
            //                implicitWidth: 30
            //                implicitHeight: 30
            //                radius: width / 2
            //                border.color: "#353637"
            //                color: control.pressed ? "#bdbebf" : "#f6f6f6"
            //                readonly property bool horizontal: control.orientation === Qt.Horizontal
            //            }
            //            tickmarks: Rectangle {
            //                x: control.leftPadding + (horizontal ? 0 : (control.availableWidth - width) / 2)
            //                y: control.topPadding + (horizontal ? (control.availableHeight - height) / 2 : 0)
            //                implicitWidth: horizontal ? 200 : 6
            //                implicitHeight: horizontal ? 6 : 200
            //                width: horizontal ? control.availableWidth : implicitWidth
            //                height: horizontal ? implicitHeight : control.availableHeight
            //                radius: 3
            //                border.color: "#353637"
            //                color: "#ffffff"
            //                scale: horizontal && control.mirrored ? -1 : 1
            //                readonly property bool horizontal: control.orientation === Qt.Horizontal
            //            }
        }
        onValueChanged: {
            signalSliderValueChanged(value.toFixed(0));
        }
    }
}

