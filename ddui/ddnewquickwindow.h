#ifndef DDNEWQUICKWINDOW_H
#define DDNEWQUICKWINDOW_H

#include <QObject>
#include <QQuickView>
#include <QQmlContext>

#include <QQuickItem>
#include "youzan/youzanobject.h"
#include "model/bdtablemodel.h"

#include "ddframeless_helper.h"

class DDNewQuickWindow : public QQuickView
{
    Q_OBJECT
public:
    explicit DDNewQuickWindow(QQuickView *parent = nullptr);

signals:

public slots:
    void setSourceAndRegsiterObj(const QUrl &url, bool regsiter=true);
    void showTrayIcon();
protected:
    void mouseDoubleClickEvent(QMouseEvent *event);
private slots:
    void slotRecevQmlReq(QVariant var, QString cmd);
private:
    QObject *m_Obj{nullptr};
    YouZanObject yZObj;
    BDTableModel mTableModel;
    BDTableModel mMyModel;
    bool isMax{false};
    DDFramelessHelper *mHelper{nullptr};
private:
    void slotShowMaxAndNormal(bool showMax);
};

#endif // DDNEWQUICKWINDOW_H
