import QtQuick 2.0

ListView{
    id:tradeView
    anchors.fill: parent
    clip: true
    property alias modelCount: tradesModel.count
    ListModel{
        id:tradesModel
    }
    model:tradesModel
    delegate: YouzanItem {
        height: 400
        width: parent.width
        zanId: zantid //订单号
        zanProductName:titlepro//商品名集合
        zanCount:countPro //数量
        zanPrice:pricepro//单价
        zanFee: fee //总价
        zanCreateTime: createTime //创建时间
        zantrade: paytype //交易类型
        onSignalClicked: {
            //每个订单的打印按钮
            yzObj.setCurrentPrintContents(gethtmlcontents());
            yzObj.openPrinfDialog(true);
        }
    }
    Component.onCompleted: {
        searchTrades("2016-03-09 00:00:00","2016-04-20 00:00:00")
    }

    function searchTrades(startDate,endDate){
        tradesModel.clear();//清空列表
        var request=new XMLHttpRequest();
        var data;
        //监听onreadystatechange事件
        request.onreadystatechange=function(){
            if(request.readyState===request.DONE){
                console.log("-----有赞API已经返回了数据---- "+request.responseText.length);
                data=JSON.parse(request.responseText.toString());
                if(request.response === 'undefined'){
                    return;
                }
                for(var i=0;i<data.response.trades.length;i++){
                    var defference=true;
                    for(var index=0;index<tradesModel.count;index++){
                        if(tradesModel.get(index).tid===data.response.trades[i].tid){
                            defference=false;
                        }
                    }
                    if(defference){
                        var titletotal="";
                        var price ="0";
                        var zanCount = "0";
                        var pic_path = "";
                        var orders=data.response.trades[i].orders;
                        for(var a=0;a<orders.length;a++){
                            price = orders[0].price;
                            pic_path = orders[0].pic_path;
                            zanCount +=+orders[a].num;
                            titletotal+=(" "+orders[a].title);
                        }
                        var sum=0.0;
                        for(var a=0;a<orders.length;a++){
                            sum+=Number(orders[a].total_fee);
                        }

                        var pay_type;
                        if(data.response.trades[i].pay_type==="WEIXIN"){
                            pay_type="微信支付";
                        }
                        else if(data.response.trades[i].pay_type==="ALIPAY "){
                            pay_type="支付宝支付";
                        }
                        else if(data.response.trades[i].pay_type==="BANKCARDPAY "){
                            pay_type="银行卡支付";
                        }
                        else if(data.response.trades[i].pay_type==="PEERPAY "){
                            pay_type="代付";
                        }
                        else if(data.response.trades[i].pay_type==="CODPAY "){
                            pay_type="货到付款";
                        }
                        else if(data.response.trades[i].pay_type==="BAIDUPAY "){
                            pay_type="百度钱包支付";
                        }
                        else if(data.response.trades[i].pay_type==="PRESENTTAKE "){
                            pay_type="直接领取赠品";
                        }
                        else if(data.response.trades[i].pay_type==="COUPONPAY"){
                            pay_type="优惠券/码全额抵扣";
                        }
                        else if(data.response.trades[i].pay_type==="BULKPURCHASE"){
                            pay_type="来自分销商的采购";
                        }
                        else{
                            pay_type="未知类型"
                        }

                        tradesModel.append({"zantid":data.response.trades[i].tid,
                                               "trade":data.response.trades[i],
                                               "fee":sum.toFixed(2),
                                               "countPro":zanCount,
                                               "titlepro":titletotal,
                                               "pricepro":price,
                                               "createTime":data.response.trades[i].created,
                                               "paytype":pay_type,
                                               "imgpath":pic_path,
                                               "selected":false});
                    }
                }
            }
        }

        //params
        var startCreated=startDate;
        var endCreadted=endDate;

        var secret="xxxx";
        var appid="xxxx";

        var currentDate=new Date();
        var method="kdt.trades.sold.get";//调用第三方接口函数

        var dateString=currentDate.getFullYear().toString()+"-"+
                (currentDate.getMonth()+1<10?"0"+(currentDate.getMonth()+1):currentDate.getMonth()+1)+"-"+
                (currentDate.getDate()<10?"0"+currentDate.getDate():currentDate.getDate())+" "+
                (currentDate.getHours()<10?"0"+currentDate.getHours():currentDate.getHours())+":"+
                (currentDate.getMinutes()<10?"0"+currentDate.getMinutes():currentDate.getMinutes())+":"+
                (currentDate.getSeconds()<10?"0"+currentDate.getSeconds():currentDate.getSeconds());

        //md5验证码
        var md5=Qt.md5(secret+"app_id"+appid+"end_created"+endCreadted+"formatjson"+"method"
                       +method+"sign_methodmd5"+"start_created"+startCreated+"timestamp"+dateString+"v1.0"+secret
                       );

        var url ="https://open.koudaitong.com/api/entry?sign="+md5+"&"+"timestamp="+
                dateString+"&v=1.0&app_id="+appid+"&method="+
                method+"&sign_method=md5&format=json"+
                "&start_created="+startCreated+
                "&end_created="+endCreadted;
        console.log("url is "+url);
        request.open("GET",url);
        request.send();
    }

    function searchTradesInfo(startDate,endDate){
        tradesModel.clear();//清空列表
        var request=new XMLHttpRequest();
        var data;
        //监听onreadystatechange事件
        request.onreadystatechange=function(){
            if(request.readyState===request.DONE){
                console.log("-----微信号是多少?---- "+(request.responseText.toString()));
                //                tradesModel.append({});
                //                return;
                data=JSON.parse(request.responseText.toString());
                console.log(request.responseText.toString())
                for(var i=0;i<data.response.trades.length;i++){

                    var defference=true;
                    for(var index=0;index<tradesModel.count;index++){
                        if(tradesModel.get(index).tid===data.response.trades[i].tid){
                            defference=false;
                        }
                    }
                    if(defference){
                        var str="";
                        var orders=data.response.trades[i].orders;
                        for(var a=0;a<orders.length;a++){
                            str+=(" "+orders[a].title+"   数量："+orders[a].num+"  单价："+orders[a].price+"元"+"\n\n\n")
                        }

                        var sum=0.0;
                        for(var a=0;a<orders.length;a++){
                            sum+=Number(orders[a].total_fee);
                        }

                        var pay_type;
                        if(data.response.trades[i].pay_type==="WEIXIN"){
                            pay_type="微信支付";
                        }
                        else if(data.response.trades[i].pay_type==="ALIPAY "){
                            pay_type="支付宝支付";
                        }
                        else if(data.response.trades[i].pay_type==="BANKCARDPAY "){
                            pay_type="银行卡支付";
                        }
                        else if(data.response.trades[i].pay_type==="PEERPAY "){
                            pay_type="代付";
                        }
                        else if(data.response.trades[i].pay_type==="CODPAY "){
                            pay_type="货到付款";
                        }
                        else if(data.response.trades[i].pay_type==="BAIDUPAY "){
                            pay_type="百度钱包支付";
                        }
                        else if(data.response.trades[i].pay_type==="PRESENTTAKE "){
                            pay_type="直接领取赠品";
                        }
                        else if(data.response.trades[i].pay_type==="COUPONPAY"){
                            pay_type="优惠券/码全额抵扣";
                        }
                        else if(data.response.trades[i].pay_type==="BULKPURCHASE"){
                            pay_type="来自分销商的采购";
                        }
                        else{
                            pay_type="未知类型"
                        }

                        str+="  应付："+sum.toFixed(2)+"元\n\n"+
                                "  订单创建日期:"+data.response.trades[i].created+"\n\n"+
                                "付款类型："+pay_type;

                        tradesModel.append({"tid":data.response.trades[i].tid,
                                               "orders":data.response.trades[i].orders,
                                               "ordersContent":str,
                                               "trade":data.response.trades[i],
                                               "fee":sum.toFixed(2),
                                               "createTime":data.response.trades[i].created,
                                               "paytype":pay_type,
                                               "selected":false});
                        str=""
                    }
                }
            }
        }

        //params
        var startCreated=startDate;
        var endCreadted=endDate;

        var secret="secret";
        var appid="appid";
        var currentDate=new Date();
        var method="kdt.trades.sold.get";//调用第三方接口函数

        var dateString=currentDate.getFullYear().toString()+"-"+
                (currentDate.getMonth()+1<10?"0"+(currentDate.getMonth()+1):currentDate.getMonth()+1)+"-"+
                (currentDate.getDate()<10?"0"+currentDate.getDate():currentDate.getDate())+" "+
                (currentDate.getHours()<10?"0"+currentDate.getHours():currentDate.getHours())+":"+
                (currentDate.getMinutes()<10?"0"+currentDate.getMinutes():currentDate.getMinutes())+":"+
                (currentDate.getSeconds()<10?"0"+currentDate.getSeconds():currentDate.getSeconds());

        //md5验证码
        var md5=Qt.md5(secret+"app_id"+appid+"end_created"+endCreadted+"formatjson"+"method"
                       +method+"sign_methodmd5"+"start_created"+startCreated+"timestamp"+dateString+"v1.0"+secret
                       );

        var url ="https://open.koudaitong.com/api/entry?sign="+md5+"&"+"timestamp="+
                dateString+"&v=1.0&app_id="+appid+"&method="+
                method+"&sign_method=md5&format=json"+
                "&start_created="+startCreated+
                "&end_created="+endCreadted;
        console.log("url is "+url);
        request.open("GET",url);
        request.send();
    }
}
