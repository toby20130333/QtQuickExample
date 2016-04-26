/*********************************************************************************
  *Copyright(C),2014-2016,www.heilqt.com
  *FileName(文件名):  youzanapi
  *Author  (作者):    TobyYi(https://github.com/toby20130333)
  *Version (版本):    1.0.0
  *CreateDate(创建日期):
  *FinishDate(完成日期):
  *Description(描述):
     1.用于主要说明此程序文件完成的主要功能
     2.与其他模块或函数的接口、输出值、取值范围、含义及参数间的控制、顺序、独立及依赖关系

  *Others(其他内容说明):
       others
  *Function List(函数列表):
     1.主要函数列表，每条记录应包含函数名及功能简要说明

     2.
  *History(历史修订记录):
     1.Date: 修改日期
       Author:修改者
       Modification:修改内容简介

     2.

**********************************************************************************/
#include "youzanapi.h"

YouZanApi::YouZanApi(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);
}

void YouZanApi::initData(QString starttime,QString endTime)
{
    QString startCreated =starttime;
    QString endCreadted = endTime;
    QString secret="secret";
    QString appid="appid";

    QDateTime currentDate=QDateTime::currentDateTime();
    QString method="kdt.trades.sold.get";//调用第三方接口函数

    QString dateString=currentDate.toString("yyyy-MM-dd hh:mm:ss");

    //    //md5验证码

    QString md5=Qtmd5(secret+"app_id"+appid+"end_created"+endCreadted+"formatjson"+"method"
                       +method+"sign_methodmd5"+"start_created"+startCreated+"timestamp"+dateString+"v1.0"+secret
                       );

    QString url ="https://open.koudaitong.com/api/entry?sign="+md5+"&"+"timestamp="+
            dateString+"&v=1.0&app_id="+appid+"&method="+
            method+"&sign_method=md5&format=json"+
            "&start_created="+startCreated+
            "&end_created="+endCreadted;
    qDebug()<<"------------"<<url;
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    QSslConfiguration conf = request.sslConfiguration();
    conf.setProtocol(QSsl::SslV3);
    request.setSslConfiguration(conf);

    QNetworkReply *reply = manager->get(request);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
             this, SLOT(replyFinished(QNetworkReply*)));
    connect(reply, SIGNAL(error(QNetworkReply::NetworkError)),
            this, SLOT(slotError(QNetworkReply::NetworkError)));
    connect(reply, SIGNAL(sslErrors(QList<QSslError>)),
            this, SLOT(slotSslErrors(QList<QSslError>)));

}

QString YouZanApi::Qtmd5(QString code)
{
    QString pwd=code;
    QString md5;
    QByteArray ba,bb;
    QCryptographicHash md(QCryptographicHash::Md5);
    ba.append(pwd);
    md.addData(ba);
    bb = md.result();
    md5.append(bb.toHex());
    return md5;
}

void YouZanApi::replyFinished(QNetworkReply *reply)
{
    qDebug()<<Q_FUNC_INFO<<reply->errorString();
}
void YouZanApi::slotError(QNetworkReply::NetworkError)
{

}

void YouZanApi::slotSslErrors(QList<QSslError>)
{

}
