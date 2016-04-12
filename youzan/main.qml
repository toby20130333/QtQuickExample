import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.2
import "../"

DDAbstractView {
    id:driverUi
    visible: true
    width: 500
    height: 480
    //与C++进行通信的对象
    Connections {
        target: yzObj
        onSignalPrintFinished: console.log("The print page data finished!")
    }

    DDuiShadowBg{
        id:bg
        width: driverUi.width
        height: driverUi.height
        bgmarigns: driverUi.bgMarign
        YouZanView{
            id:youzanView
            anchors.fill:  parent
            anchors.margins: driverUi.bgMarign
        }
    }
}
