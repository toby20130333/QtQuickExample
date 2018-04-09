import QtQuick 2.0

Canvas {
    id: canvas
    width: 100
    height: 200
    property bool userHor: true
    property int speedinterval: 40
    property var context
    property var w: 0
    property var h: 0
    property var drop:[]
    property var wordsArr:[]
    property var font_size: 16

    property var clearColor: 'rgba(0, 0, 0, .1)'; //每次循环加0.1透明的蒙层
    property var lttime: 0
    property var columns: 0; // 字体下落速度
    property var wordColor
    property var words
    property var textColor: "green"
    onPaint: {
        var context = canvas.getContext("2d");
        drawMatrix(context);
    }
    onWidthChanged: {
        initData()
    }

    Timer{
        id:timeId
        interval: speedinterval; running: true; repeat: true
        onTriggered: {
            requestPaint()
        }
    }
    //以下为js函数 绘制
    function drawMatrix(context){
        context.fillStyle = clearColor;
        context.fillRect(0,0,canvas.width,canvas.height);
        context.fillStyle=textColor;
        context.font = font_size+"px arial";
        for(var i=0;i<columns;i++){
            var text = wordsArr[Math.floor(Math.random() * wordsArr.length)];
            if(userHor){
                context.fillText(text,i*font_size,drop[i]*font_size);/*get 0 and 1*/
                if(drop[i]*font_size>(canvas.height*2/3)&&Math.random()>0.85)/*reset*/
                    drop[i]=0;
            }else{
                context.fillText(text,drop[i]*font_size,i*font_size);/*get 0 and 1*/
                if(drop[i]*font_size>(canvas.width*2/3)&&Math.random()>0.85)/*reset*/
                    drop[i]=0;
            }
            drop[i]++;
        }
    }
    function initData(){
        words = "0123456789qwertyuiopasdfghjklzxcvbnm,./;'\大数据[]QWERTYUIOP{}ASDFGHJHJKL:ZXCVBBNM<>?がガぎギぐグげゲごゴきゃキャきゅキュきょキョりゃリャゅリュりょリョ"
        wordsArr = words.split('')
        drop=[];
        font_size =16;
        if(userHor){
            columns = canvas.width/font_size;
        }else{
           columns = canvas.height/font_size;
        }
        console.log("--cal--columns-------- "+columns)
        for(var i=0;i<columns;i++)
            drop[i]=1;
    }
}
