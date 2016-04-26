import QtQuick 2.0
import "../"
import "./youzan.js" as YSTHEME

Item {
    property int whichDateEdit: 0
    DDCloseButton{
        id:close
        width: 30
        height: width
        anchors.top: parent.top
        anchors.right: parent.right
        z:20
        onSignalCloseApp: {
            signalQmlOptions("close app","system");
        }
    }
    YouZanWindow{
        id:mainView
        visible: false
    }

    //顶部的标题栏
    Rectangle{
        id: tid
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#12AADF"
        z:10
        Text {
            text: "  仅仅测试-下单时间"
            anchors.left:  parent.left
            height: parent.height
            width: parent.width/2
            font.family: YSTHEME.textfontfamily
            verticalAlignment: Text.AlignVCenter
            color: "white"
        }
    }
    YouZanAnimation  {
        id:anmitionsId
        anchors.top: tid.top
        anchors.topMargin: 0
        anchors.right: close.left
        anchors.rightMargin: 10
        height: tid.height
        width: parent.width*2/3
        z:10
        onSignalDateEditChanged: {
            console.log("发现的标志位: "+iType);
            whichDateEdit = iType;
            if(iType==1){
                mainView.setCalDate(new Date);
            }
            if(!mainView.visible){
                mainView.visible = true;
            }
        }
        onSignalDataCalChanged: {
                mainView.setCalDate(calDate);
        }
    }
    //中间的列表
    YouZanApi{
        id:yz
        anchors.top: tid.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }
    //左边的批量打印按钮
    Rectangle{
        id:prinfBtn
        width: 80
        height: 40
        radius: 20
        anchors.left: parent.left
        anchors.margins: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "#12AADF"
        border.width: 1
        border.color: "grey"
        visible: yz.modelCount>=0
        MouseArea{
            id:ma2
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                refreshBtn.color = "#12aacc";
            }
            onExited: {
                refreshBtn.color = "#12AADF";
            }
            onClicked: {
                yz.prinfMuch();
            }
        }

        Text {
            text: "批量打印"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.family: YSTHEME.textfontfamily
            font.pixelSize: YSTHEME.textFontSize
        }
    }
    //右侧的刷新按钮
    Rectangle{
        id:refreshBtn
        width: 80
        height: 80
        radius: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        color: "#12AADF"
        border.width: 1
        border.color: "grey"
        visible: yz.modelCount>=0
        MouseArea{
            id:ma
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                refreshBtn.color = "#12aacc";
            }
            onExited: {
                refreshBtn.color = "#12AADF";
            }
            onClicked: {
                getbetweenData();
            }
        }

        Text {
            text: "查询订单"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.family: YSTHEME.textfontfamily
            font.pixelSize: YSTHEME.textFontSize
        }
    }

    function getbetweenData(){
       var dateArr =     anmitionsId.getDatas();
        console.log("-----------------"+dateArr[0]);
        yz.searchTrades(dateArr[0],dateArr[1]);
    }
}
