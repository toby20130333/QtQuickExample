import QtQuick 2.1
import QtQuick.Window 2.1

Window {
    id:driverUi
    visible: true
    width: 816
    height: 600
    flags: Qt.FramelessWindowHint|Qt.Window
    color:"transparent"// "#01B6E0"
    MouseArea{
        id:ma
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        property int ix:0
        property int iy:0
        onPressed:{
            ma.ix = mouseX;
            ma.iy = mouseY;
        }
        onPositionChanged: {
            var dyx = mouseX - ma.ix;
            var dyy = mouseY - ma.iy;
            var arryTmp = [dyx,dyy];
            driverUi.setX(driverUi.x+dyx);
            driverUi.setY(driverUi.y+dyy);
        }
    }
    DDuiShadowBg{
        width: driverUi.width
        height: driverUi.height
        DDSplitView {
            anchors.fill:  parent
            anchors.margins: 8
        }
    }
//    DDSplitView {
//        anchors.fill:  parent
//        anchors.margins: 0
//    }
}
