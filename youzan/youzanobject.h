#ifndef YOUZANOBJECT_H
#define YOUZANOBJECT_H

#include <QObject>
#include <QTextDocument>
#include <QPainter>

class YouZanObject : public QObject
{
    Q_OBJECT
public:
    explicit YouZanObject(QObject *parent = 0);

    Q_INVOKABLE int getCurrentPage() const;
    void doPrint();
signals:
    void signalPrintFinished();
public slots:
    void slotSetcurrentPage(int curpage);
    void slotSetUseImagePrinf(bool use=true);
    void openPrinfDialog(bool isOpen = true);
    void printString(const QString &htmlString);
    void prinfImage(const QString& imgpath);
    void setCurrentPrintContents(const QString& html);
    void setCurrentPrintImage(const QString& html);

private:
    int mCurrentPage;
    QStringList mHtmlList;
    QStringList mImageList;
    bool mUseImg;
};

#endif // YOUZANOBJECT_H
