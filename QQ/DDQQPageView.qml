import QtQuick 2.0

Item {
    width: 100
    height: 200
    Canvas {
          id: mycanvas
          anchors.fill: parent
          onPaint: {
              var ctx = getContext("2d");
              ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
              ellipseOne(ctx,100,100,20,50);
          }
      }
    function ellipseOne(context, x, y, a, b) {
        var step = (a > b) ? 1 / a : 1 / b;
        context.beginPath();
        context.moveTo(x + a, y);
        for(var i = 0; i < 2 * Math.PI; i += step) {
            context.lineTo(x + a * Math.cos(i), y + b * Math.sin(i));
        }
        context.closePath();
        context.fill();
    }
}
