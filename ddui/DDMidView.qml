import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import "../Driver/" as DriverPage

Item{
    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        Rectangle {
            id: centerItem
            Layout.minimumWidth: 560
            Layout.fillWidth: true
            color: "#F7FEFF"
            DriverPage.DDTabView {
                id: midPage
//                source: "images/mid.jpg"
                anchors.fill: parent
            }
        }
        Rectangle {
            width: 250
            Layout.minimumWidth: 250
            Layout.maximumWidth: 250
            color: "#E3F7FF"
            Image {
                id: name2
                source: "qrc:/images/right.jpg"
                anchors.fill: parent
            }
        }
    }
    function changePage(id){
        midPage.currentIndex = id;
    }
}
