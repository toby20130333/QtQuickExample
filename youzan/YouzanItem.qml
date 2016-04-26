import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0
import duoduo.encode.components 1.0

import "./youzan.js" as YSTHEME

Item{
    property string zanTitle: "QtQuick网站-www.heilqt.com"
    property string zanId: "ZB2129102102910290"
    property string zanProductName: "康师傅冰红茶 100ml"
    property string zanCount: "1"
    property string zanPrice: "10.0 "
    property string zanFee: "10.0"
    property string zanCreateTime: "2016年5月13日下午13：30"
    property string zantrade: "微信支付"
    property string zanAddress: "上海黄浦区黄河路21-43号 鸿祥大厦17层"
    property string zanUserName: "赵飞燕"
    property string zanPhoneNum:"010-65155271"
    property string zanImg: "qrc:/images/128.png"

    signal signalClicked();
    signal signalOpenprinf();

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
                font.family: YSTHEME.textfontfamily
            }
        }
        Rectangle{
            id:midRect
            width: parent.width-2
            height: parent.height-140
            anchors.top: tid.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: name3.top
            border.color: "white"
            TextEdit {
                id: name2
                anchors.fill: parent
                anchors.margins: 10
                readOnly: true
                clip:true
                textFormat: TextEdit.RichText
                font.family: YSTHEME.textfontfamily
                font.pixelSize: Qt.platform.os=="windows"?YSTHEME.textFontSize:YSTHEME.textFontSize-2
                text: "<font color='#000000'>*订单号</font>: "+zanId+"              No: "+(index+1)+"<br><br><font color='#000000'>*商品名</font>: "+zanProductName
                      +"<br><br><font color='#000000'>*数量</font>: "+zanCount+"<br><br><font color='#000000'>*单价</font>: "+zanPrice+"元<br><br><font color='#000000'>*应付</font>: "+zanFee
                      +"元<br><br><font color='#000000'>*订单创建时间</font>: "+zanCreateTime+"<br><br><font color='#000000'>*付款类型</font>: "+zantrade
                      +"<br><br><font color='#000000'>*联系人</font>: "+zanUserName+"<br><br><font color='#000000'>*收货地址</font>: "+zanAddress+"<br><br><font color='#000000'>*联系号码</font>: "+zanPhoneNum
            }
        }
        QREnCode {
            id: imgUrl
            width: 96
            height: width
            anchors.bottom: dianxiaoEr.top
            anchors.bottomMargin: -4
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true
            qrSize: Qt.size(width,width)
            qrData:zanTitle+index //encode contents
            qrForeground: "#29aee1" //encode color
            qrBackground: "white"
            qrMargin: 2
            qrMode: QREnCode.MODE_8    //encode model
            qrLevel: QREnCode.LEVEL_Q // encode level
            qrLogo: zanImg //or local path or qrc path but not network url
            onQrSaveFileChanged: {
                console.log("We get save file path is :"+qrfilepath)
            }
        }
        Text {
            id:dianxiaoEr
            text: "<font color='#000000'>--校园小二  感谢您的光临--</font>"
            width: parent.width-2
            height: 20
            anchors.bottom: name3.top
            font.family: YSTHEME.textfontfamily
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "black"
        }

        Button {
            id: name3
            width: 100
            height: 25
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 0
                    color: YSTHEME.btn_color
                    Text {
                        id: prinfTxt
                        text: "打  印"
                        anchors.fill: parent
                        color: "white"
                        font.pixelSize: 14
                        font.family: YSTHEME.textfontfamily
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
                //saveItemToImage(zanId+".png");
            }
        }
    }

    function gethtmlcontents(){
        //console.log("text is "+name2.text)
        return name2.text;
    }

    function showorhide(show){
        name3.visible = show;
    }
    function saveItemToImage(filename){
        showorhide(false);
        rect.grabToImage(function(result) {
            result.saveToFile(filename);
            signalOpenprinf();
            showorhide(true);
        });
        return filename;
    }
}

