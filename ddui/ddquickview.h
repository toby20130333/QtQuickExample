#ifndef YBQUICKVIEW_H
#define YBQUICKVIEW_H

#include <QQuickView>
#include <QMouseEvent>
#include <QQmlContext>

#include <QPoint>
#include <QCursor>
#include <QRect>
#include <QPainter>
#include <QPaintEvent>
#include <QDebug>
#include <QEvent>
#include <QParallelAnimationGroup>
#include <QPropertyAnimation>
#include <QQuickItem>
#include "youzan/youzanobject.h"
#include "model/bdtablemodel.h"

enum Direction{
    UP = 0,
    DOWN=1,
    LEFT,
    RIGHT,
    LEFTTOP,
    LEFTBOTTOM,
    RIGHTBOTTOM,
    RIGHTTOP,
    NONE
};

#define PADDING 5
class YbQuickView : public QQuickView
{
    Q_OBJECT
public:
    explicit YbQuickView(QQuickView *parent = 0);
    ~YbQuickView();

    void setMaxYbView(QSize);
    void setHasMouse(bool isHasMouse);

    void setSourceAndRegsiterObj(const QUrl& url,bool regsiter=true);

    Q_INVOKABLE void setCanMoveRange(const QPoint& point);

    bool isHasMouseEvent;
    bool finishedhideAni;
    bool isHide;
    bool isZhiding;
    bool isMax;

    bool finishedshowAni;
    int iHeight;
    QParallelAnimationGroup* group;
    QParallelAnimationGroup* group2;
    QParallelAnimationGroup* group3;
    QParallelAnimationGroup* group4;

private:
    void region(const QPoint &cursorPoint);
protected:
    void mouseReleaseEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mousePressEvent(QMouseEvent *event);
    void mouseDoubleClickEvent(QMouseEvent *event);
    bool event(QEvent *);
private:
    bool isLeftPressDown;
    QPoint dragPosition,moveRangePostion;
    Direction dir;
    bool canMove;

    QObject *m_Obj;
    YouZanObject yZObj;
    BDTableModel mTableModel;
    BDTableModel mMyModel;
public slots:
    void slotFinishedAnimation1();
    void slotFinishedAnimation2();

    void slotShowMaxAndNormal(bool showMax);

    void slotRecevQmlReq(QVariant var,QString cmd);
    void showTrayIcon();
};

#endif // YBQUICKVIEW_H
