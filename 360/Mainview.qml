import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.2
import "../"

DDAbstractView  {
    id:ui360
    visible: true
    width: 900+bgMarign*2
    height: 600+bgMarign*2
    //与C++进行通信的对象
    Connections {
        //target: yzObj
        //onSignalPrintFinished: console.log("The print page data finished!")
    }
    DDuiShadowBg{
        id:bg
        width: ui360.width
        height: ui360.height
        bgmarigns: ui360.bgMarign
        MainPage{
            id:youzanView
            anchors.fill:  parent
            anchors.margins: ui360.bgMarign
        }
    }

}
