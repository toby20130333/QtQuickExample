import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 72
    height: 72
    signal signalTopBtnClicked(var btn);
    Row{
        anchors.fill: parent
        DDHomeButton{
            id:homeBtn
            height: parent.height
            onSignalBtnClicked: {
                signalTopBtnClicked(0)
            }
        }
        DDHomeButton{
            id:homeBtn2
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194547/72/"
            btnTxt: "有赞商城"
            onSignalBtnClicked: {
                signalTopBtnClicked(1)
            }
        }
        DDHomeButton{
            id:homeBtn3
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194540/72/"
            btnTxt: "迅雷7"
            onSignalBtnClicked: {
                signalTopBtnClicked(2)
            }
        }
        DDHomeButton{
            id:homeBtn4
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194545/72/"
            btnTxt: "360安全卫士"
            onSignalBtnClicked: {
                signalTopBtnClicked(3)
            }
        }
        DDHomeButton{
            id:homeBtn5
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194543/72/"
            btnTxt: "QQ"
            onSignalBtnClicked: {
                signalTopBtnClicked(4)
            }
        }
        DDHomeButton{
            id:homeBtn6
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194534/72/"
            btnTxt: "多多指教"
            onSignalBtnClicked: {
                signalTopBtnClicked(5)
            }
        }
        DDHomeButton{
            id:homeBtn7
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/42882/72/"
            btnTxt: "数字雨"
            onSignalBtnClicked: {
                signalTopBtnClicked(6)
            }
        }
        DDHomeButton{
            id:homeBtn8
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1150085/72/"
            btnTxt: "诗词歌赋"
            onSignalBtnClicked: {
                signalTopBtnClicked(7)
            }
        }
    }
    DDCloseButton{
        id:close
        width: 27
        height: 22
        anchors.top: parent.top
//        anchors.margins: 1
        anchors.right: parent.right
        onSignalCloseApp: {
            signalQmlOptions("system","close");
        }
    }
}
