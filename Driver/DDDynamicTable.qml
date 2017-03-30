import QtQuick 2.1
import QtQuick.Controls 1.2
Item{
    Component
    {
        id: columnComponent
        TableViewColumn{width: 100 }
    }

    TableView {
        id: view
        anchors.fill: parent
        itemDelegate: Item {
            Text {
                anchors.fill: parent
                color: (styleData.selected)?"#d53d3d":"grey"
                elide: styleData.elideMode
                text: styleData.value
                font.family: "微软雅黑"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }
        rowDelegate: Rectangle{
            height: styleData.selected?40:36
            border.width: styleData.selected?2:0
            border.color: styleData.selected?"red":"grey"
        }
        headerDelegate: Rectangle{
            Text {
                anchors.fill: parent
                text: styleData.value
                font.family: "微软雅黑"
                color:"#d53d3d"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
                font.bold: true
            }
            height: 40
            border.width: 1
            border.color:"grey"
        }
        resources:
        {
            var roleList = mMyModel.userRoleNames();
            console.log("aslkkkkkkkkkkkkkkkkkk "+roleList.length);
            var temp = []
            for(var i=0; i<roleList.length-1; i++)
            {
                var role  = roleList[i];
                temp.push(columnComponent.createObject(view, { "role": role, "title": role}))
            }
            return temp
        }

        model: mMyModel
    }
}
