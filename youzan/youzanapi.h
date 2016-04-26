#ifndef YOUZANAPI_H
#define YOUZANAPI_H

#include <QObject>
#include <QDateTime>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

class YouZanApi : public QObject
{
    Q_OBJECT
public:
    explicit YouZanApi(QObject *parent = 0);

    void initData(QString starttime, QString endTime);

    void requestData();
    QString Qtmd5(QString code);
signals:

public slots:
    void replyFinished(QNetworkReply*);
    void slotError(QNetworkReply::NetworkError);
    void slotSslErrors(QList<QSslError>);
private:
    QNetworkAccessManager *manager;
};

#endif // YOUZANAPI_H
