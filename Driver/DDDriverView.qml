import QtQuick 2.1
import QtQuick.Window 2.1
import "../ddui" as DDui

DDui.DDAbstractView {
    id:driverUi
    visible: true
    width: 816
    height: 600
    DDui.DDuiShadowBg{
        id:bg
        width: driverUi.width
        height: driverUi.height
        bgmarigns: driverUi.bgMarign
        DDui.DDSplitView {
            id:midView
            anchors.fill:  parent
            anchors.margins: driverUi.bgMarign
        }
    }
}
