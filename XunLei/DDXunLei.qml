import QtQuick 2.0
import QtQuick.Window 2.1
import "../ddui" as DDui

DDui.DDAbstractView {
    id:xunLei
    width: 462
    height: 350
   DDui. DDuiShadowBg{
        id:bg
        width: xunLei.width
        height: xunLei.height
        bgmarigns:8
        BorderImage {
            id: bgImage
            source: "Online/x_518207e66afcbtk.jpg"
            anchors.fill: parent
            anchors.margins:bg.bgmarigns
            DDXunView{
                id:view
                anchors.fill: parent
            }
            DDui.DDCloseButton{
                id:close
                width: 32
                height: width
                anchors.top: parent.top
                anchors.right: parent.right
                onSignalCloseApp: {
                    signalQmlOptions("close app","system");
                }
            }
        }
    }
}
