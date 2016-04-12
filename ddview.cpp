#include "ddview.h"
#include <QDebug>

DDView::DDView(QQuickView *parent):
    QQuickView(parent),
    m_shadowSize(5)
{
    setColor(Qt::transparent);
    setResizeMode(QQuickView::SizeRootObjectToView);
}

DDView::~DDView()
{

}

void DDView::keyPressEvent(QKeyEvent *e)
{
    return QQuickView::keyPressEvent(e);
}

void DDView::keyReleaseEvent(QKeyEvent *e)
{
    return QQuickView::keyReleaseEvent(e);
}

void DDView::mouseMoveEvent(QMouseEvent *e)
{
    return QQuickView::mouseMoveEvent(e);
}

void DDView::mousePressEvent(QMouseEvent *e)
{
    return QQuickView::mousePressEvent(e);
}

void DDView::mouseReleaseEvent(QMouseEvent *e)
{
    return QQuickView::mouseReleaseEvent(e);
}
#ifdef Q_OS_WIN
bool DDView::nativeEvent(const QByteArray &eventType, void *message, long *result)
{
    if (this->minimumHeight() >= this->maximumHeight()
            && this->minimumWidth() >= this->maximumWidth())
    {
        return QQuickView::nativeEvent(eventType, message, result);
    }
    Q_UNUSED(eventType)
    MSG *param = static_cast<MSG*>(message);
    switch (param->message)
    {
    case WM_NCHITTEST:
    {
//        qDebug()<<Q_FUNC_INFO<<eventType;
        HWND hWnd = (HWND)this->winId();
        int nX = GET_X_LPARAM(param->lParam) - this->geometry().x();
        int nY = GET_Y_LPARAM(param->lParam) - this->geometry().y();

        //指定标题栏区域
        if (0)
        {
            return false;
        }
        else
        {
            *result = HTCAPTION;
        }

        //如果窗口最大化了，则不支持resize
        if (IsZoomed(hWnd))
            return true;
        if (this->windowState() == Qt::WindowMaximized)
            return true;
        if (nX > 0 && nX < this->m_shadowSize)
            *result = HTLEFT;
        if (nX > this->width() - this->m_shadowSize && nX < this->width())
            *result = HTRIGHT;
        if (nY > 0 && nY < this->m_shadowSize)
            *result = HTTOP;
        if (nY > this->height() - this->m_shadowSize && nY < this->height())
            *result = HTBOTTOM;
        if (nX > 0 && nX < this->m_shadowSize && nY > 0 && nY < this->m_shadowSize)
            *result = HTTOPLEFT;
        if (nX > this->width() - this->m_shadowSize && nX < this->width() && nY > 0 && nY < this->m_shadowSize)
            *result = HTTOPRIGHT;
        if (nX > 0 && nX < this->m_shadowSize && nY > this->height() - this->m_shadowSize && nY < this->height())
            *result = HTBOTTOMLEFT;
        if (nX > this->width() - this->m_shadowSize && nX < this->width()
                && nY > this->height() - this->m_shadowSize && nY < this->height())
            *result = HTBOTTOMRIGHT;
        return true;// QQuickView::nativeEvent(eventType, message, result);;
    }
    default:{
        return QQuickView::nativeEvent(eventType, message, result);
    }
    }
    return  QQuickView::nativeEvent(eventType, message, result);;
}
#endif
