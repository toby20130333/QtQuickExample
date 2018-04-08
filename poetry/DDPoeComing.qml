import QtQuick 2.0

Rectangle {
    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

    Text {
        id: popTxt
        anchors.fill: parent
        text: "诗词歌赋 待开发 "
        renderType: Text.NativeRendering
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pixelSize: 33
    }
}
