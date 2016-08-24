import QtQuick 2.3
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0

ProgressBarStyle{
    property color outerbordercolor: control.value<=0.8? "#FFE655" :"#B2FF77"
//    property color innerbordercolor: "#B2FF77"
//    property color conicalcolor: "red"

   panel : Rectangle
   {
      color: "transparent"
      implicitWidth: 80
      implicitHeight: implicitWidth

      Rectangle
      {
         id: outerRing
         z: 0
         anchors.fill: parent
         radius: Math.max(width, height) / 2
         color: "transparent"
         border.color: outerbordercolor
         border.width: 4
      }

      Rectangle
      {
         id: innerRing
         z: 1
         anchors.fill: parent
         anchors.margins: (outerRing.border.width - border.width) / 2
         radius: outerRing.radius
         color: "transparent"
         border.color: outerbordercolor
         border.width: 1

         ConicalGradient
         {
            source: innerRing
            anchors.fill: parent
            gradient: Gradient
            {
               GradientStop { position: 0.00; color: outerbordercolor }
               GradientStop { position: control.value; color: outerbordercolor }
               GradientStop { position: control.value + 0.01; color: "transparent" }
               GradientStop { position: 1.00; color: "transparent" }
            }
         }
      }

      DDText
      {
         id: progressLabel
         anchors.centerIn: parent
         color: "white"
         text: (control.value * 100).toFixed()
         font.pixelSize: 66
         font.family: "Comic Sans MS"
         DDText
         {
            id: scoreTxt
            anchors.left: parent.right
            anchors.bottom: parent.bottom
            color: "white"
            text:"分"
            font.pixelSize: 14
         }
      }
   }
}
