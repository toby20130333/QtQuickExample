import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

TableView {
    id:roowView
    property var comList: [1,2,3,4,5,6,7]
    itemDelegate: Item {
        function isCheckColumn( columnIndex )
        {
            return roowView.getColumn( columnIndex ) === checkedColumn
        }
        function isComBoxColumn( columnIndex )
        {
            return roowView.getColumn( columnIndex ) === comBoxId
        }
        function isCanShow(columnIndex){
            return isCheckColumn(columnIndex) || isComBoxColumn(columnIndex)
        }

        CheckBox
        {
            anchors.centerIn: parent
            checked: styleData.value
            visible: isCheckColumn( styleData.column )
        }
        ComboBox
        {
            anchors.centerIn: parent
            width: 80
            model: comList
            visible: isComBoxColumn( styleData.column )
        }
        Text {
            anchors.fill: parent
            color: (styleData.selected)?"#d53d3d":"grey"
            elide: styleData.elideMode
            text:  !isCanShow( styleData.column )?styleData.value:""
            font.family: "微软雅黑"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible:( !isCanShow( styleData.column))
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

    TableViewColumn {
        id:checkedColumn
        role: "checked"
        title: "勾选"
        width: roowView.width/8
    }
    TableViewColumn {
        id:comBoxId
        role: "comboLst"
        title: "下拉列表"
        width: roowView.width/8
    }
    TableViewColumn {
        role: "dessert"
        title: "文字内容"
        width: roowView.width/8
    }
    TableViewColumn {
        role: "dbtype"
        title: "文字类型"
        width: roowView.width/4
    }
    TableViewColumn {
        role: "flat"
        title: "文字样式"
        width: roowView.width/4
    }
    TableViewColumn {
        role: "carbs"
        title: "文字苦"
        width: roowView.width/4
    }
    model: mTableModel
    function createObj(col){
        var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20}',
                                            parentItem,
                                            "dynamicSnippet1");
    }
}
