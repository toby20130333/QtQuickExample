import QtQuick 2.1

Rectangle {
    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
    DDQQPageView{
        anchors.fill: parent
    }

    Text {
        id: popTxt
        anchors.fill: parent
        text: "QQ待开发---椭圆绘制"
        renderType: Text.NativeRendering
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pixelSize: 33
    }
}
