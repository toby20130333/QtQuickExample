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
