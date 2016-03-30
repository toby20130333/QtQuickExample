#ifndef DDVIEW_H
#define DDVIEW_H

#include <QObject>
#include <QQuickView>
#include <WindowsX.h>
#include <QMouseEvent>

class DDView : public QQuickView
{
    Q_OBJECT
public:
   explicit DDView(QQuickView *parent = 0);
    ~DDView();

protected:
    virtual void     keyPressEvent(QKeyEvent *e);
    virtual void     keyReleaseEvent(QKeyEvent *e);
    virtual void     mouseMoveEvent(QMouseEvent *e);
    virtual void     mousePressEvent(QMouseEvent *e);
    virtual void     mouseReleaseEvent(QMouseEvent *e);

#if (QT_VERSION >= QT_VERSION_CHECK(5, 0, 0))
    bool nativeEvent(const QByteArray &eventType, void *message, long *result);
#else
    bool winEvent ( MSG * message, long * result );
#endif

private:
    int m_shadowSize;
};

#endif // DDVIEW_H
