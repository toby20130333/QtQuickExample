import QtQuick 2.0

BorderImage {
    id: name
//    source: "file:///C:/Qt/360/menghuansanjiao/MainFrame/Image/background_mainwnd.jpg"
    source: "qrc:/images/360/main/background_mainwnd.jpg"
    width: 100; height: 100
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    TopBar{
        id:topBar
        width: parent.width
        height: 40
    }
    MidPage{
        anchors.top: topBar.bottom
        width: parent.width
        anchors.bottom: btmBar.top       
    }

    BottomBar {
        id:btmBar
        width: parent.width
        anchors.bottom: parent.bottom
    }
}
