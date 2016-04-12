import QtQuick 2.0
import "../"

Item {
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
            text: "有赞API测试---订单查询"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
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
                for(var i=0;i<yz.modelCount;i++){
                    console.log("----qml-------"+i);
                    if(yz.currentIndex>=yz.modelCount){
                        yz.currentIndex = 0;
                    }
                    yzObj.setCurrentPrintContents(yz.currentItem.gethtmlcontents());
                    yz.currentIndex = i+1;
                }
                yzObj.openPrinfDialog(true);
            }
        }

        Text {
            text: "批量打印"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: 16
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

            }
        }

        Text {
            text: "刷新订单"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: 16
        }
    }
}
