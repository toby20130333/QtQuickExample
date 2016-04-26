/*
  This is a base root qml view and all requset can trans to C++
   like Qt all signls and slot can be followed by this childrens
*/
import QtQuick 2.1

Item {
    visible: true
    width: 816
    height: 600
    property double bgMarign: 8
    //you can emit this signal to c++
    signal signalQmlOptions(variant msg,string type);

    //max and normal window states
    function transToQml(showMax){
        if(showMax){
            bgMarign = 0;
        }else{
            bgMarign = 8;
        }
    }
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
        }
    }
}
