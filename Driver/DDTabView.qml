import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../XunLei/" as XunLei
import "../youzan/" as YouZan
import "../360/" as  View360
import "../QQ/" as QQ

TabView {
        id: tabView
        anchors.fill: parent
        anchors.margins: 0
        Tab {
            title: "tabledemo"
            BDTableView{
                anchors.fill: parent
            }
        }
        Tab {
            title: "youzandemo"
            YouZan.YouZanMain{
                anchors.fill: parent
            }
        }
        Tab {
            title: "xunleidemo"
            XunLei.DDXunView{
                anchors.fill: parent
            }
        }
        Tab {
            title: "360demo"
            View360.Mainview{
                anchors.fill: parent
            }
        }
        Tab {
            title: "QQdemo"
            QQ.DDQQMainView{
                anchors.fill: parent
            }
        }
        Tab {
            title: "Dynicdemo"
            DDDynamicTable{
                anchors.fill: parent
            }
        }
        style: TabViewStyle {
            property color frameColor: "#999"
            property color fillColor: "#eee"
            frameOverlap: 1
            frame: Rectangle {
                color: "#eee"
                border.color: "transparent"
            }
            tab: Item {
                height: 1
            }
        }
    }
