import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import "./youzan.js" as YouzanFunction

Window {
    id:dateView
    width: 300
    height: 400
    visible: true
    flags: Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    color: "transparent"
    Rectangle{
        anchors.fill: parent
        border.color: "#CDCDCD"
        border.width: 1
        radius: 5
        DDCloseButton{
            id:closeCal
            width: 30
            height: width
            anchors.top: parent.top
            anchors.right: parent.right
            z:20
            onSignalCloseApp: {
                dateView.visible = false;
            }
        }
        YZCalView{
            id:calView
            width: parent.width
            height: parent.height*3/5-10
        }
        Column{
            anchors.bottom: parent.bottom
            width: parent.width-10
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height*2/5
            spacing: 10
            YouzanTextTime{
                id:timeEdit
                width: parent.width-10
            }
            YouzanSlider {
                txt:"时钟"
                width: parent.width-10
                onSignalSliderValueChanged: {
                    timeEdit.updateHH(valueId)
                }
            }
            YouzanSlider {
                txt: "分钟"
                width: parent.width-10
                maxValue: 59
                minValue: 0
                onSignalSliderValueChanged: {
                    timeEdit.updateMM(valueId)
                }
            }
            YouzanSlider {
                txt: "秒钟"
                width: parent.width-10
                maxValue: 59
                minValue: 0
                onSignalSliderValueChanged: {
                    timeEdit.updateSS(valueId);
                }
            }
            YouzanBottomGroup{
                id:btnGroup
                width: parent.width-10
                onSignalClickBtn: {
                    if(itype==0){
                        calView.setStartTimeCal(new Date);
                    }else{
                        dateView.visible = false;
                        var time = timeEdit.getHMS();
                        var date = calView.selectedDate;
                        if(whichDateEdit==0){
                            anmitionsId.setLefDateTimeString(YouzanFunction.getNowFormatDateLine(date,time));
                        }else{
                            anmitionsId.setRightDateTimeString(YouzanFunction.getNowFormatDateLine(date,time));
                        }
                        console.log("get date format "+YouzanFunction.getNowFormatDateLine(date,time)+" time "+time);
                    }
                }
            }
        }
    }
    function setCalDate(date){
        calView.setStartTimeCal(date);
    }
}

