#ifndef YOUZANOBJECT_H
#define YOUZANOBJECT_H

#include <QObject>
#include <QTextDocument>

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

    void openPrinfDialog(bool isOpen = true);
    void printString(const QString &htmlString);

    void setCurrentPrintContents(const QString& html);
private:
    int mCurrentPage;
    QStringList mHtmlList;
};

#endif // YOUZANOBJECT_H
