import QtQuick 2.1
import QtQuick.Window 2.1
import "../"

DDAbstractView {
    id:driverUi
    visible: true
    width: 816
    height: 600
    DDuiShadowBg{
        id:bg
        width: driverUi.width
        height: driverUi.height
        bgmarigns: driverUi.bgMarign
        DDSplitView {
            id:midView
            anchors.fill:  parent
            anchors.margins: driverUi.bgMarign
        }
    }
}
