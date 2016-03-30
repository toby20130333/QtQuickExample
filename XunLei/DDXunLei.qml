import QtQuick 2.0
import QtQuick.Window 2.1
import "../"
Window {
    visible: true
    flags: Qt.FramelessWindowHint|Qt.Window
    color:"transparent"// "#01B6E0"
    id:xunLei
    width: 462
    height: 350
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
            xunLei.setX(xunLei.x+dyx);
            xunLei.setY(xunLei.y+dyy);
        }
    }
    DDuiShadowBg{
        id:bg
        width: xunLei.width
        height: xunLei.height
        bgmarigns:8
        BorderImage {
            id: bgImage
            source: "Online/x_518207e66afcbtk.jpg"
            anchors.fill: parent
            anchors.margins:bg.bgmarigns
            DDXunView{
                id:view
                anchors.fill: parent
            }
        }
    }
}
