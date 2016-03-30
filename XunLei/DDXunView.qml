import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.XmlListModel 2.0

TabView {
       id: tabView
       anchors.fill: parent
       anchors.margins: 8       
       XmlListModel {
           id: xmlModel
           source: "Online/online.xml"
           query: "/thunder_skin/group/package"
           XmlRole { name: "skinname"; query: "name/string()" }
           XmlRole { name: "thumbnail"; query: "thumbnail/string()" }
           XmlRole { name: "popularity"; query: "popularity/string()" }
           XmlRole { name: "dynamic"; query: "dynamic/string()" }
           XmlRole { name:"packageId";query:"@id/string()"}

           Component.onCompleted: {
            console.log("xmlModel "+xmlModel.count)
           }
       }
       XmlListModel {
           id: xmlModelLocal
           source: "Online/local.xml"
           query: "/thunder_skin/group/package"
           XmlRole { name: "skinname"; query: "name/string()" }
           XmlRole { name: "thumbnail"; query: "thumbnail/string()" }
           XmlRole { name: "popularity"; query: "popularity/string()" }
           XmlRole { name: "dynamic"; query: "dynamic/string()" }
           XmlRole { name:"packageId";query:"@id/string()"}

           Component.onCompleted: {
            console.log("xmlModel "+xmlModel.count)
           }
       }
       Tab {
           title: "在线皮肤"
        DDXunGridView{
            id:onLine
            curModel: xmlModel
            onSignalBtnClicked: {
                console.log("clicked ID "+skinId)
            }
        }
       }
       Tab {
           title: "我的皮肤"
           DDXunLocalView{
               id:localView
               curModel: xmlModelLocal
           }
       }
       style: TabViewStyle {
           property color frameColor: "#85C583"
           property color fillColor: "#eee"
           property color bgColor: "#00ffffff"
           frameOverlap: 1
           frame: Rectangle {
               color: "#F2F9F2"
           }
           tab: Rectangle {
               color: styleData.selected ? fillColor : bgColor
               implicitWidth: Math.max(text.width + 24, 80)
               implicitHeight: styleData.selected ?30:28
               opacity: styleData.selected?1:0.6
               Rectangle { height: 1 ; width: parent.width ; color: frameColor}
               Rectangle { height: parent.height ; width: 1; color: frameColor}
               Rectangle { x: parent.width -1; height: parent.height ; width: 1; color: frameColor}
               Text {
                   id: text
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: parent.verticalCenter
                   width: text.paintedWidth
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   text: styleData.title
                   color: styleData.selected ? "black" : "gray"
               }
               Rectangle {
                   anchors.right: parent.right
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.rightMargin: 4
                   implicitWidth: 16
                   implicitHeight: 16
                   radius: width/2
                   color: control.hovered ? "#eee": "#00ffffff"
                   border.color: control.hovered ?"gray":"#00ffffff"
                   MouseArea {
                       anchors.fill: parent
                       hoverEnabled: true
                       onEntered: {
                       }
                       onExited: {
                       }
                   }
               }
           }
       }
   }
