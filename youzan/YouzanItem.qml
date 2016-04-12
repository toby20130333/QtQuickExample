import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0

Item{
    property string zanTitle: "校园小二-YOUR BEST CHOICE"
    property string zanId: "ZB2129102102910290"
    property string zanProductName: "康师傅冰红茶 100ml"
    property string zanCount: "1"
    property string zanPrice: "10.0 "
    property string zanFee: "10.0"
    property string zanCreateTime: "2016-01-01 10:20:00"
    property string zantrade: "微信支付"

    property string zanImg:"../images/qr.jpg"

    signal signalClicked();
    Rectangle {
           id: background
           anchors.fill: parent
           color: "white"
       }
       RectangularGlow {
           id: effect
           anchors.fill: rect
           glowRadius: 4
           spread: 0.2
           color: "black"
           cornerRadius: rect.radius + glowRadius
       }
    Rectangle {
        id:rect
        width: parent.width-140
        height: parent.height-20
        border.width: 0
        border.color: "grey"
        anchors.centerIn: parent
        radius: 2
        Rectangle{
            id: tid
            width: parent.width-2
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#A0DDF2"
            Text {
                text: zanTitle
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "white"
            }
        }
        Rectangle{
            id:midRect
            width: parent.width-2
            height: parent.height-80
            anchors.top: tid.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: name3.top
            border.color: "white"
            TextEdit {
                id: name2
                anchors.fill: parent
                anchors.margins: 10
                readOnly: true
                textFormat: TextEdit.RichText
                text: "<br><font color='#12AADF'>*订单号</font>: "+zanId+"              No: "+(index+1)+"<br><br><font color='#12AADF'>*商品名</font>: "+zanProductName
                      +"<br><br><font color='#12AADF'>*数量</font>: "+zanCount+"<br><br><font color='#12AADF'>*单价</font>: "+zanPrice+"元<br><br><font color='#12AADF'>*应付</font>: "+zanFee
                      +"元<br><br><font color='#12AADF'>*订单创建时间</font>: "+zanCreateTime+"<br><br><font color='#12AADF'>*付款类型</font>: "+zantrade
            }
        }
        Text {
            text: "<font color='#12AADF'>--校园小二  感谢您的光临--</font>"
            width: parent.width-2
            height: 30
            anchors.bottom: name3.top
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "black"
        }
        Image {
            id: imgUrl
            source: zanImg
            width: 96
            height: width
            anchors.right:  parent.right
            anchors.rightMargin: 10
            anchors.top: midRect.top
            anchors.topMargin: 40
            z:20
            smooth: true
        }
        Button {
            id: name3
            width: 100
            height: 30
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 0
                    color: "#12AADF"
                    Text {
                        id: prinfTxt
                        text: "打  印"
                        anchors.fill: parent
                        color: "white"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                signalClicked();
            }
        }
    }

    function gethtmlcontents(){
        console.log("text is "+name2.text)
        return name2.text;
    }
}

