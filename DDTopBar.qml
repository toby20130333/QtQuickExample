import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 72
    height: 72
    Row{
        anchors.fill: parent
        DDHomeButton{
            id:homeBtn
            height: parent.height
        }
        DDHomeButton{
            id:homeBtn2
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194547/72/"
            btnTxt: "Blogger"
        }
        DDHomeButton{
            id:homeBtn3
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194540/72/"
            btnTxt: "Apple"
        }
        DDHomeButton{
            id:homeBtn4
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194545/72/"
            btnTxt: "Beats"
        }
        DDHomeButton{
            id:homeBtn5
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194543/72/"
            btnTxt: "Bank Of"
        }
        DDHomeButton{
            id:homeBtn6
            height: parent.height
            btnUrl: "http://download.easyicon.net/png/1194534/72/"
            btnTxt: "8Track"
        }
    }
}
