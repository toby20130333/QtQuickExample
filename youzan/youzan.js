var textWhiteColor = "white"
var textBlackColor = "black"
var textRedColor = "red"
var textfontfamily =  "微软雅黑"
var textFontSize = 14;
var active_color = "#008720"
var btn_color ="#12AADF"

function getNowFormatDateLine(zanDate,zanTime) {
    var date = zanDate;
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate+" "+zanTime;
    return currentdate;
}
