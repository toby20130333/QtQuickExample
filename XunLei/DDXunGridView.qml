import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    width: 300; height: 200
    property XmlListModel curModel
    signal signalBtnClicked(string skinId);
    Component {
        id: contactDelegate
        Item {
            id:imgItem
            width: grid.cellWidth;
            height: grid.cellHeight
            property string packageid: packageId
            Image {
                id:itemImg;
                source: "Online/"+thumbnail;
                anchors.fill: parent
                anchors.margins: 2
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                id:ma
                anchors.fill: imgItem
                hoverEnabled: true
                onClicked: {
                    signalBtnClicked(packageId);
                }
                onEntered: {
                    if (itemImg.status == Image.Ready)rectBg.opacity=0.8;
                }
                onExited: {
                    rectBg.opacity=0.0;
                }
            }
            Rectangle{
                 id:rectBg
                 color: "#66656A"
                 width: itemImg.width;
                 height: itemImg.height
                 anchors.centerIn: parent
                 opacity: 0
                Text {
                    id: btntext
                    width: grid.cellWidth;
                    height:  itemImg.height/4
                    text: skinname
                    visible: (rectBg.opacity==0.8)
                    anchors.top: rectBg.top
                    anchors.topMargin: rectBg.height/4
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pixelSize: 12
                    renderType: Text.NativeRendering
                }
                Text {
                    id: popTxt
                    width: grid.cellWidth;
                    height:  itemImg.height/4
                    text: "人气:"+popularity
                    visible: btntext.visible
                    renderType: Text.NativeRendering
                    anchors.top: btntext.bottom
                    anchors.topMargin: rectBg.height/6
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pixelSize: 12
                }
            }
        }
    }
    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 130;//parent.width/4;
        cellHeight: 70
        model: curModel
        delegate: contactDelegate
        focus: true
        clip: true
    }
}
