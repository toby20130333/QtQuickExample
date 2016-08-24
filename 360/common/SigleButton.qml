import QtQuick 2.1

Item{
    id:closeBtn
    width: txtId.width
    height: btnImg.height+txtId.height+6
    property int hasMouse: 0
    property bool reallysigle: false
    property url btnurl: "qrc:/images/360/main/security_safe_"
    property string btmTitle: "电脑清理"
    property color txtColor: "white"
    signal signalCloseApp();
    MouseArea{
        id:ma
        anchors.fill: closeBtn
        hoverEnabled: true
        onClicked: {
            closeBtn.hasMouse = 2;
            signalCloseApp();
        }
        onEntered: {
            closeBtn.hasMouse = 1;
        }
        onExited: {
            closeBtn.hasMouse = 0;
        }
    }
     DDImage{
        id: btnImg
        width: sourceSize.width
        height: sourceSize.height
        anchors.horizontalCenter: parent.horizontalCenter
        source: btnurl+getimgurl();
        opacity: !hasMouse?0.8:1
    }
     DDText{
         id:txtId
         text: btmTitle
         height: 20
         color: txtColor
         font.pixelSize: 12
         width: reallysigle?btnImg.sourceSize.width:paintedWidth
         anchors.bottom: parent.bottom
     }

     function getimgurl(){
         if(reallysigle)return "";
         return hasMouse==0?"normal.png":(hasMouse==1)?"hover.png":"press.png"
     }
}
