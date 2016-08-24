import QtQuick 2.1

Item{
    id:closeBtn

    property bool hasMouse: false
    property int framewidth: 35
    property int frameheight: 24
    property int framecount: 4
    property url btnurl: "qrc:/images/360/main/close.png"
    property int clickType: 0
    signal signalClickedBtn(int clicktype); //0 close 1:min 2:menu 3:feedback
    clip: true

    width: framewidth
    height: frameheight
    MouseArea{
        id:ma
        anchors.fill: closeBtn
        hoverEnabled: true
        onClicked: {
            signalClickedBtn(clickType);
            animated.running = true;
            animated.currentFrame = 2
            animated.pause();
            animated.running = false;
        }
        onEntered: {
            animated.running = true;
            closeBtn.hasMouse = true;
            animated.currentFrame = 1
            animated.pause();
            animated.running = false;
        }
        onExited: {
            closeBtn.hasMouse = false;
            animated.running = true;
            animated.currentFrame = 0
            animated.pause();
            animated.running = false;
        }
    }
    AnimatedSprite {
        id: animated;
        anchors.fill: parent
        running:true
        source: btnurl;
        currentFrame: 0
        frameWidth: framewidth;
        frameHeight: frameHeight;
        frameDuration: 400;
        frameCount: framecount;
        frameX: 0;
        frameY: 0;
        visible: true
        Component.onCompleted: {
            animated.pause();
            animated.running = false;
        }
    }
}
