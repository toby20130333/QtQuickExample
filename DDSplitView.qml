import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

SplitView {
    anchors.fill: parent
    orientation: Qt.Vertical
    DDTopBar {
        width: parent.width
        Layout.maximumHeight: 100
        Layout.minimumHeight: 100
        color: "#01B6E1"
    }
    DDMidView {
        id: centerItem
        Layout.minimumHeight: 100
        Layout.fillHeight: true
    }
    DDBottomBar {
        Layout.maximumHeight: 30
        Layout.minimumHeight: 30
        height: 30
        width: parent.width
    }
}
