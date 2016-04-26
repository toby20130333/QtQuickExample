import QtQuick 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 1.2
import "./youzan.js" as YSTHEME

Calendar {
    id:caleView
    width:230
    height:230
    frameVisible:false
    style: CalendarStyle {
        gridVisible: false
        background:Item{
            width: caleView.width
            height: caleView.height
        }
        navigationBar:Item{
            width: caleView.width
            height: 30
            Image {
                id: pre
                width: 16
                height: 16
                anchors.right: navTxt.left
                anchors.verticalCenter: parent.verticalCenter
                source: "http://download.easyicon.net/png/15303/16/"
                MouseArea{
                    id:preMa
                    anchors.fill: parent
                    onClicked: {
                        caleView.showPreviousMonth();
                    }
                }
            }
            Text {
                id: navTxt
                text: styleData.title
                font.family: YSTHEME.textfontfamily+2
                font.pixelSize: YSTHEME.textFontSize+2
                anchors.centerIn: parent
                width: 80
                height: 40
                color: YSTHEME.textBlackColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }
            Image {
                id: next
                width: 16
                height: 16
                rotation: 180
                anchors.left: navTxt.right
                anchors.verticalCenter: parent.verticalCenter
                source: "http://download.easyicon.net/png/15303/16/"
                MouseArea{
                    id:nextMa
                    anchors.fill: parent
                    onClicked: {
                        caleView.showNextMonth();
                    }
                }
            }
        }
        gridColor:Qt.rgba(0.2,0.2,0.2,0.9)
        dayOfWeekDelegate:Item{
            implicitWidth: 40
            implicitHeight: 30
            Text {
                id: name
                text: returnWeek(styleData.index)
                font.family: YSTHEME.textfontfamily
                font.pixelSize: YSTHEME.textFontSize+2
                anchors.fill: parent
                color:  YSTHEME.textBlackColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        dayDelegate: Item {
            implicitWidth: 30
            implicitHeight: 30
            Rectangle {
                width: 30
                height: 30
                visible: styleData.selected
                radius:width/2
                border.width:1
                smooth: true
                border.color: styleData.selected ? YSTHEME.textRedColor:YSTHEME.textWhiteColor
                color: YSTHEME.btn_color//styleData.selected ? "red" : (styleData.visibleMonth && styleData.valid ? "#444" : "#00ffffff");
            }
            Label {
                text: styleData.date.getDate()
                width: 30
                height: 30
                font.pixelSize: YSTHEME.textFontSize+2
                font.family: YSTHEME.textfontfamily
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: (styleData.selected ?YSTHEME.textWhiteColor:(styleData.visibleMonth && styleData.valid ? YSTHEME.textBlackColor:"#454545"))
            }
        }
    }
    function returnWeek(index){
        //console.log("index??? "+index);
        var day = "一";
        switch(index){
        case 0:
            day = "日";
            break;
        case 1:
            day = "一";
            break;
        case 2:
            day = "二";
            break;
        case 3:
            day = "三";
            break;
        case 4:
            day = "四";
            break;
        case 5:
            day = "五";
            break;
        case 6:
            day = "六";
            break;
        }
        return day;
    }
    //设置起始时间的日历
    function setStartTimeCal(date){
        caleView.selectedDate = date;
    }
}

