import QtQuick 2.0
import "./youzan.js" as YSTHEME

Rectangle {
    id:rightView
    width: 160
    height: 30
    color: "#00ffffff"
    signal signalDateEditChanged(int iType);//0 :start 1:end date
    signal signalDataCalChanged(var calDate);
    //    border.color: "gray"
    //    radius: 4
    Item{
        id:righttxt
        anchors.fill: parent
        anchors.margins: 2
        visible: righttxt.width!=0
        Rectangle {
            id:leftTime
            width: parent.width*4/9
            height: rightView.height-10
            anchors.verticalCenter: parent.verticalCenter
            border.color: "#8AC3F0"
            color: "#00ffffff"
            visible: righttxt.width!=0
            TextInput{
                id:leftInput
                anchors.fill: parent
                anchors.margins: 2
                font.pointSize :10
                font.family: YSTHEME.textfontfamily
                color: "white"
                visible: righttxt.width!=0                
                onFocusChanged: {
                    if(focus)
                    signalDateEditChanged(0);
                }
            }
        }
        Text {
            id: name
            width: parent.width/9
            height: rightView.height-4
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: leftTime.right
            text: qsTr("至")
            color: YSTHEME.textWhiteColor
            font.family: YSTHEME.textfontfamily
            visible: righttxt.width!=0
        }
        Rectangle {
            id:rightTime
            width: parent.width*4/9
            height: rightView.height-10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: name.right
            border.color: "#8AC3F0"
            color: "#00ffffff"
            visible: righttxt.width!=0
            TextInput{
                id:rightInput
                anchors.fill: parent
                anchors.margins: 2
                font.pointSize :10
                color: "white"
                font.family: YSTHEME.textfontfamily
                visible: righttxt.width!=0
                onFocusChanged: {
                    console.log("focus "+focus);
                    if(focus)
                    signalDateEditChanged(1);
                }
            }
        }      
    }

    Behavior on width {
        PropertyAnimation { properties: "width";duration: 800; easing.type: Easing.InOutQuad }
    }
    onFocusChanged: {
        setrightviewHideOrShow(false);
    }

    Component.onCompleted: {
        leftInput.focus = false;
        rightInput.focus = false;
        leftInput.text = yugi(10);
        rightInput.text=getNowFormatDateLine();
        getbetweenData();
    }

    function getDatas(){
        var dateArr=[getYouzanDateLine(leftInput.text),getYouzanDateLine(rightInput.text)];
        return dateArr;
    }

    /*
    setting the right control bar to hide or show by animation
   */
    function setrightviewHideOrShow(isshow){
        if(!isshow){
            rightView.width=0;
            rightView.focus = false;
            righttxt.visible =false;
            console.log("离开该区域 进行隐藏")

        }else{
            rightView.focus = true;
            righttxt.visible =true;
            rightView.width=parent.width*0.4;
            console.log("进入该区域 进行动画显示")
        }
    }

    //得到查询终止时间
    function getNowFormatDateLine() {
        var date = new Date();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear()  + month  + strDate+"000000";
        return formatString(currentdate);
    }
    //得到查询起始时间
    function yugi(n){
        var now = new Date;
        now.setDate(now.getDate() - n);
        var month = now.getMonth() + 1;
        var strDate = now.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        signalDataCalChanged(now);
        var currentdate = now.getFullYear()  + month  + strDate+"000000";
        return  formatString(currentdate);;
    }

    function getYouzanDateLine(datastring) {
        var date = new Date();
        var datestring = formatString(datastring);
        return datestring;
    }
    ///格式化时间格式 yyyy-MM-dd hh:mm:ss

    function formatString(str){
        var datastring =    str.replace(/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/g,'$1-$2-$3 $4:$5:$6');
//        console.log("format date "+datastring);
        return datastring;
    }

    function setLefDateTimeString(strDate){
        leftInput.text = strDate;
    }
    function setRightDateTimeString(strDate){
        rightInput.text = strDate;
    }
}

