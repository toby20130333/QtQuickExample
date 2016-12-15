import QtQuick 2.1

Rectangle {
    id:btmRect
    width: 100
    height: 30
    color: "#009EDB"
    property string btmVersion: "主程序版本: V1.0.123"
    property string btmConn: "已连接到多多指教服务器"
    Text {
        id: versionTxt
        width: btmRect.width/2-4
        height: btmRect.height
        anchors.left: parent.left
        anchors.leftMargin: 4
        text: btmVersion
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pixelSize: 12
        renderType: Text.NativeRendering
    }
    Text {
        id: connctTxt
        anchors.left: versionTxt.right
        width: btmRect.width/2-4
        height: btmRect.height
        text: btmConn
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.pixelSize: 12
    }
}
