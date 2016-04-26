import QtQuick 2.0
import "./youzan.js" as YSTHEME

Item {
    width: 100
    height: 20
    property string txt: "时间: "
    property string h: "00"
    property string m: "00"
    property string s: "00"

    Row{
        anchors.fill: parent
        spacing: 8
        Text {
            id: txtId
            text: txt
            height: parent.height
            width: parent.width/9
            font.family: YSTHEME.textfontfamily
            color: YSTHEME.textBlackColor
        }
        Text {
            id: timeTxtId
            text: h+":"+m+":"+s
            height: parent.height
            width: parent.width/9
            font.family: YSTHEME.textfontfamily
            color:YSTHEME.textBlackColor
        }
    }
    function updateHH(hh){
        if(hh <=9){
            hh = "0"+hh;
        }

        h = hh;
    }
    function updateMM(mm){
        if(mm <=9){
            mm = "0"+mm;
        }
        m = mm
    }
    function updateSS(secondes){
        if(secondes <=9){
            secondes = "0"+secondes;
        }
        s= secondes;
    }
    function getHMS(){
        return timeTxtId.text
    }
}

