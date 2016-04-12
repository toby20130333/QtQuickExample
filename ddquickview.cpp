#include "ddquickview.h"

YbQuickView::YbQuickView(QQuickView *parent) :
    QQuickView(parent),
    finishedhideAni(true),
    finishedshowAni(true),
    isMax(false),
    m_Obj(NULL)
{
    isLeftPressDown = false;
    this->dir = NONE;
    isZhiding = true;
    isHide = false;
    isHasMouseEvent = true;
    iHeight = 600;

    setFlags(Qt::FramelessWindowHint|Qt::WindowStaysOnTopHint|Qt::SubWindow);
    setColor(Qt::transparent);
    setResizeMode(QQuickView::SizeRootObjectToView);
    setMinimumWidth(816);
}

YbQuickView::~YbQuickView()
{
}

void YbQuickView::setMaxYbView(QSize size)
{
    this->setMaximumSize(size);
}

void YbQuickView::setHasMouse(bool isHasMouse)
{
    isZhiding = isHasMouse;
}

void YbQuickView::setSourceAndRegsiterObj(const QUrl &url, bool regsiter)
{
#ifdef USE_YOUZAN
    YouZanObject yZObj;
    this->rootContext()->setContextProperty("yzObj", &yZObj);
#endif
    setSource(url);
    if(regsiter){
        m_Obj  = this->rootObject();
        connect(m_Obj,SIGNAL(signalQmlOptions(QVariant,QString)),this,SLOT(slotRecevQmlReq(QVariant,QString)));
    }
}
void YbQuickView::mouseReleaseEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton) {
        isLeftPressDown = false;
        if(dir != NONE) {
            this->setCursor(QCursor(Qt::ArrowCursor));
        }
    }
    QQuickView::mouseReleaseEvent(event);
}

void YbQuickView::mousePressEvent(QMouseEvent *event)
{
    switch(event->button()) {
    case Qt::LeftButton:
        isLeftPressDown = true;
        if(dir != NONE) {
        } else {
            if(  (event->pos().y()<=200) && (event->pos().x() >= this->width()-200))
            {
                dragPosition = event->globalPos() - this->frameGeometry().topLeft();
                canMove = true;
            }else{
                event->accept();
                canMove = false;
                QQuickView::mousePressEvent(event);
                return;
            }
        }
        break;
    default:
        QQuickView::mousePressEvent(event);
    }
    QQuickView::mousePressEvent(event);
}

void YbQuickView::mouseDoubleClickEvent(QMouseEvent *event)
{
    QRect rect(10,2,this->width()-70,100);
    if(isZhiding)
    {
        QQuickView::mouseDoubleClickEvent(event);
        return;
    }
    if(event->button() == Qt::LeftButton && rect.contains(event->pos())) {
        if(!isMax){
            isMax = !isMax;
            slotShowMaxAndNormal(true);
            this->showMaximized();
            this->update();
        }else{
            isMax = !isMax;
            slotShowMaxAndNormal(false);
            this->showNormal();
            update();
        }
    }
    QQuickView::mouseDoubleClickEvent(event);
}
bool YbQuickView::event(QEvent *e)
{
    switch (e->type()) {
    case QEvent::Enter:
    {
        //qDebug()<<"Enter  "<<isHide<<" "<<finishedshowAni;
        if(!isZhiding){
            return false;
        }
        if(!isHasMouseEvent){
            e->ignore();
            return false;
        };
        if(isHide && finishedshowAni)
        {
            finishedshowAni = false;
            //qDebug()<<"QEvent::Enter in it  "<<this->width()<<"\n"<<iHeight;
            group2 = new QParallelAnimationGroup;
            connect(group2,SIGNAL(finished()),this,SLOT(slotFinishedAnimation1()));
            QPropertyAnimation *animation = new QPropertyAnimation(this, "height");
            animation->setDuration(200);
            animation->setStartValue((24));
            animation->setEndValue(iHeight);

            QPropertyAnimation *animation3 = new QPropertyAnimation(this, "opacity");
            animation3->setDuration(500);
            animation3->setStartValue(0.8);
            animation3->setEndValue(1.0);

            group2->addAnimation(animation);
            group2->addAnimation(animation3);
            animation->setEasingCurve(QEasingCurve::InOutQuad);
            group2->start();
        }

    }break;
    case QEvent::Leave:
    {
        //qDebug()<<"Leave  "<<!isHide<<finishedhideAni;
        if(!isZhiding){
            return false;
        }
        if(!isHasMouseEvent){e->ignore();return true;}
        if(this->position().y() <=0 && !isHide &&finishedhideAni)
        {
            finishedhideAni = false;
            group3 = new QParallelAnimationGroup;
            connect(group3,SIGNAL(finished()),this,SLOT(slotFinishedAnimation2()));
            QPropertyAnimation *animation = new QPropertyAnimation(this, "height");
            animation->setDuration(500);
            animation->setStartValue(iHeight);
            animation->setEndValue((21));

            QPropertyAnimation *animation3 = new QPropertyAnimation(this, "opacity");
            animation3->setDuration(500);
            animation3->setStartValue(1.0);
            animation3->setEndValue(0.8);

            group3->addAnimation(animation);
            group3->addAnimation(animation3);
            animation->setEasingCurve(QEasingCurve::InOutQuart);
            group3->start();
        }

    }break;
    default:
        break;
    }
    return QQuickView::event(e);
}
void YbQuickView::mouseMoveEvent(QMouseEvent *event)
{
    QPoint gloPoint = event->globalPos();
    QRect rect(0,0,width(),height());
    QPoint tl = mapToGlobal(rect.topLeft());
    QPoint rb = mapToGlobal(rect.bottomRight());

    if(!isLeftPressDown) {
        this->region(gloPoint);
    } else {
        if(dir != NONE) {
            QRect rMove(tl, rb);
            switch(dir) {
            case LEFT:
                if(rb.x() - gloPoint.x() <= this->minimumWidth())
                {
                    rMove.setX(tl.x());
                }
                else{
                    rMove.setX(gloPoint.x());
                }
                break;
            case RIGHT:
                if(gloPoint.x()- tl.x() <=this->minimumWidth()){
                    if(rb.x() - tl.x() <= this->minimumWidth())
                    {
                        rMove.setWidth(this->minimumWidth());
                    }else{
                        rMove.setWidth(gloPoint.x() - tl.x());
                    }
                }else{
                    rMove.setWidth(gloPoint.x() - tl.x());
                }
                break;
            case UP:
                if(rb.y() - gloPoint.y() <= this->minimumHeight())
                    rMove.setY(tl.y());
                else
                    rMove.setY(gloPoint.y());
                break;
            case DOWN:
                if(gloPoint.y()- tl.y() <=this->minimumHeight())
                {
                    rMove.setHeight(this->minimumHeight());
                }else{
                    rMove.setHeight(gloPoint.y() - tl.y());
                }
                break;
            case LEFTTOP:
                if(rb.x() - gloPoint.x() <= this->minimumWidth())
                    rMove.setX(tl.x());
                else
                    rMove.setX(gloPoint.x());
                if(rb.y() - gloPoint.y() <= this->minimumHeight())
                    rMove.setY(tl.y());
                else
                    rMove.setY(gloPoint.y());
                break;
            case RIGHTTOP:
                if(rb.x() - gloPoint.x() <= this->minimumWidth())
                    rMove.setX(tl.x());
                else
                    rMove.setX(gloPoint.x());
                if(rb.y() - gloPoint.y() <= this->minimumHeight())
                    rMove.setY(tl.y());
                else
                    rMove.setY(gloPoint.y());
                break;
            case LEFTBOTTOM:
                if(rb.x() - gloPoint.x() <= this->minimumWidth())
                    rMove.setX(tl.x());
                else
                    rMove.setX(gloPoint.x());
                if(rb.y() - gloPoint.y() <= this->minimumHeight())
                    rMove.setY(tl.y());
                else
                    rMove.setY(gloPoint.y());
                break;
            case RIGHTBOTTOM:
                if(rb.x() - gloPoint.x() <= this->minimumWidth())
                    rMove.setX(tl.x());
                else
                    rMove.setX(gloPoint.x());
                if(rb.y() - gloPoint.y() <= this->minimumHeight())
                    rMove.setY(tl.y());
                else
                    rMove.setY(gloPoint.y());
                break;
            default:

                break;
            }
            if(rMove.width() <= this->maximumWidth() && rMove.height() <= this->maximumHeight())
            {
                this->setGeometry(rMove);
                iHeight = this->height();
            }
        } else {
            if(canMove){
                setPosition(event->globalPos() - dragPosition);
            }
            event->accept();
        }
    }
    QQuickView::mouseMoveEvent(event);
}

void YbQuickView::region(const QPoint &cursorGlobalPoint)
{
    QRect rect(0,0,width(),height());;
    QPoint tl = mapToGlobal(rect.topLeft());
    QPoint rb = mapToGlobal(rect.bottomRight());
    int x = cursorGlobalPoint.x();
    int y = cursorGlobalPoint.y();
    if(tl.x() + PADDING >= x && tl.x() <= x && tl.y() + PADDING >= y && tl.y() <= y) {
        // 左上角
        dir = LEFTTOP;
        this->setCursor(QCursor(Qt::SizeFDiagCursor));
    } else if(x >= rb.x() - PADDING && x <= rb.x() && y >= rb.y() - PADDING && y <= rb.y()) {
        // 右下角
        dir = RIGHTBOTTOM;
        this->setCursor(QCursor(Qt::SizeFDiagCursor));
    } else if(x <= tl.x() + PADDING && x >= tl.x() && y >= rb.y() - PADDING && y <= rb.y()) {
        //左下角
        dir = LEFTBOTTOM;
        this->setCursor(QCursor(Qt::SizeBDiagCursor));
    } else if(x <= rb.x() && x >= rb.x() - PADDING && y >= tl.y() && y <= tl.y() + PADDING) {
        // 右上角
        dir = RIGHTTOP;
        this->setCursor(QCursor(Qt::SizeBDiagCursor));
    } else if(x <= tl.x() + PADDING && x >= tl.x()) {
        // 左边
        dir = LEFT;
        this->setCursor(QCursor(Qt::SizeHorCursor));
    } else if( x <= rb.x() && x >= rb.x() - PADDING) {
        // 右边
        dir = RIGHT;
        this->setCursor(QCursor(Qt::SizeHorCursor));
    }else if(y >= tl.y() && y <= tl.y() + PADDING){
        // 上边
        dir = UP;
        this->setCursor(QCursor(Qt::SizeVerCursor));
    } else if(y <= rb.y() && y >= rb.y() - PADDING) {
        // 下边
        dir = DOWN;
        this->setCursor(QCursor(Qt::SizeVerCursor));
    }else {
        // 默认
        dir = NONE;
        this->setCursor(QCursor(Qt::ArrowCursor));
    }
}
void YbQuickView::slotFinishedAnimation1()
{

    isHide =false;
    finishedshowAni = true;
    if(this->y() <=-10)
    {
        this->setPosition(this->x(),-10);
    }
    //qDebug()<<"slotFinishedAnimation1  "<<this->position();
    this->show();
    delete group2;
}

void YbQuickView::slotFinishedAnimation2()
{
    isHide =true;
    finishedhideAni = true;
    delete group3;
    if(this->y() <=-10)
    {
        this->setPosition(this->x(),-10);
    }
    this->show();
}
///
/// \brief YbQuickView::slotShowMaxAndNormal
/// \param showMax
///  你可以注册该方法到QML当中
void YbQuickView::slotShowMaxAndNormal(bool showMax)
{
    if(m_Obj){
        QVariant returnVal;
        QMetaObject::invokeMethod(m_Obj,"transToQml",Q_RETURN_ARG(QVariant,returnVal),
                                  Q_ARG(QVariant,showMax));
    }
}
///
/// \brief YbQuickView::slotRecevQmlReq
/// \param var
/// \param cmd
/// 接受来自QML的请求
void YbQuickView::slotRecevQmlReq(QVariant var, QString cmd)
{
    if(cmd == "system"){
        this->close();
        qApp->quit();
    }
}
