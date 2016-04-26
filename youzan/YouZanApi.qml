import QtQuick 2.0

ListView{
    id:tradeView
    anchors.fill: parent
    clip: true
    property alias modelCount: tradesModel.count
    ListModel{
        id:tradesModel
    }
    model:4//tradesModel
    delegate: YouzanItem {
        id:zanItem
        height: tradeView.height-40
        width: parent.width
        zanId: zantid //订单号
        zanProductName:titlepro//商品名集合
        zanCount:countPro //数量
        zanPrice:pricepro//单价
        zanFee: fee //总价
        zanCreateTime: createTime //创建时间
        zantrade: paytype //交易类型
        zanAddress: address
        zanPhoneNum: phonenumber
        zanUserName:receiver_name
        //        zanImg: imgpath
        onSignalClicked: {
            //每个订单的打印按钮
            yzObj.slotSetUseImagePrinf(usePrinfImg)
            if(usePrinfImg){
                yzObj.setCurrentPrintImage(saveItemToImage(zanId+".png"));
            }else{
                yzObj.setCurrentPrintContents(gethtmlcontents());
            }
        }
        onSignalOpenprinf: {
            yzObj.openPrinfDialog(true);
        }
    }

    function prinfMuch(){
        yzObj.slotSetUseImagePrinf(usePrinfImg)
        if(usePrinfImg){
            for(var i=0;i<yz.modelCount;i++){
                if(yz.currentIndex>=yz.modelCount){
                    yz.currentIndex = 0;
                }
                yzObj.setCurrentPrintImage(yz.currentItem.saveItemToImage(tradesModel.get(i).zantid));
                yz.currentIndex = i+1;
            }
        }else{
            for(var i=0;i<yz.modelCount;i++){
                if(yz.currentIndex>=yz.modelCount){
                    yz.currentIndex = 0;
                }
                yzObj.setCurrentPrintContents(yz.currentItem.gethtmlcontents());
                yz.currentIndex = i+1;
            }
        }
        yzObj.openPrinfDialog(true);
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
                    var tradeStatus =data.response.trades[i].status;
                    if(tradeStatus != "TRADE_BUYER_SIGNED")continue;
//                    console.log("买家已签收------------"+i);
                    var defference=true;
                    var receiver_address="";
                    var receiver_mobile = "";
                    var receiver_name = "";
                    receiver_address = data.response.trades[i].receiver_address;
                    receiver_mobile = data.response.trades[i].receiver_mobile;
                    receiver_name   = data.response.trades[i].receiver_name;

                    if(defference){
                        var titletotal="";
                        var price ="0";
                        var zanCount = 0;
                        var pic_path = "";

                        var orders=data.response.trades[i].orders;
                        for(var a=0;a<orders.length;a++){
                            price = orders[0].price;
                            pic_path = orders[0].pic_path;

                            zanCount +=orders[a].num;
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
                                               "receiver_name":receiver_name,
                                               "address":receiver_address,
                                               "phonenumber":receiver_mobile,
                                               "selected":false});
                    }
                }
            }
        }

        //params
        var startCreated=startDate;
        var endCreadted=endDate;

        //填写有赞商城API
        var secret="vivi is a pig";
        var appid="vivi is a pig";

        var currentDate=new Date();
        var method="kdt.trades.sold.get";//调用第三方接口函数

        var dateString=currentDate.getFullYear().toString()+"-"+
                (currentDate.getMonth()+1<10?"0"+(currentDate.getMonth()+1):currentDate.getMonth()+1)+"-"+
                (currentDate.getDate()<10?"0"+currentDate.getDate():currentDate.getDate())+" "+
                (currentDate.getHours()<10?"0"+currentDate.getHours():currentDate.getHours())+":"+
                (currentDate.getMinutes()<10?"0"+currentDate.getMinutes():currentDate.getMinutes())+":"+
                (currentDate.getSeconds()<10?"0"+currentDate.getSeconds():currentDate.getSeconds());

        //md5验证码 按照参数名称升序排列
        var md5=Qt.md5(secret+"app_id"+appid+"end_created"+endCreadted+"formatjson"+"method"
                       +method+"sign_methodmd5"+"start_created"+startCreated+"statusTRADE_BUYER_SIGNEDtimestamp"+dateString+"v1.0"+secret
                       );

        var url ="https://open.koudaitong.com/api/entry?sign="+md5+"&"+"timestamp="+
                dateString+"&v=1.0&app_id="+appid+"&method="+
                method+"&sign_method=md5&format=json"+
                "&status=TRADE_BUYER_SIGNED"+
                "&start_created="+startCreated+
                "&end_created="+endCreadted;
        console.log("请求的连接 : "+url);
        request.open("GET",url);
        request.send();
    }
}
