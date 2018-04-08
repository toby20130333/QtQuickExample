#include "ddnewquickwindow.h"
#include <QQmlEngine>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QAction>

DDNewQuickWindow::DDNewQuickWindow(QQuickView *parent) : QQuickView(parent)
{
    setFlags(Qt::FramelessWindowHint|Qt::WindowStaysOnTopHint);
    setColor(Qt::transparent);
    setResizeMode(QQuickView::SizeRootObjectToView);
    setMinimumWidth(816);
    mHelper = new DDFramelessHelper(this);
    mHelper->activateOnQmlWidget(this);
    mHelper->setTitleHeight(100);
}
///
/// \brief YbQuickView::showTrayIcon
/// 显示系统托盘 可扩展
///
void DDNewQuickWindow::showTrayIcon(){
    QObject *root = 0;
    if (rootObject() != NULL)
    {
        root = rootObject();
        QAction *minimizeAction = new QAction(QObject::tr("Mi&nimize"), this);
        root->connect(minimizeAction, SIGNAL(triggered()), this, SLOT(hide()));
        QAction *maximizeAction = new QAction(QObject::tr("Ma&ximize"), this);
        root->connect(maximizeAction, SIGNAL(triggered()), this, SLOT(showMaximized()));
        QAction *restoreAction = new QAction(QObject::tr("&Restore"), this);
        root->connect(restoreAction, SIGNAL(triggered()), this, SLOT(showNormal()));
        QAction *quitAction = new QAction(QObject::tr("&Quit"), this);
        root->connect(quitAction, SIGNAL(triggered()), qApp, SLOT(quit()));

        QMenu *trayIconMenu = new QMenu();
        trayIconMenu->addAction(minimizeAction);
        trayIconMenu->addAction(maximizeAction);
        trayIconMenu->addAction(restoreAction);
        trayIconMenu->addSeparator();
        trayIconMenu->addAction(quitAction);

        QSystemTrayIcon *trayIcon = new QSystemTrayIcon(this);
        trayIcon->setContextMenu(trayIconMenu);
        trayIcon->setIcon(QIcon(":/360logo.ico"));
        trayIcon->show();
    }

}
///
/// \brief DDNewQuickWindow::setSourceAndRegsiterObj
/// \param url
/// \param regsiter
/// 加载主qml界面
/// 并且注册C++对象到qml，方便与qml进行交互
///
void DDNewQuickWindow::setSourceAndRegsiterObj(const QUrl &url, bool regsiter)
{
#ifndef USE_YOUZAN
    this->rootContext()->setContextProperty("yzObj", &yZObj);
#endif
    if(regsiter){
        //model需要在setsource之前设置
        mTableModel.initData(14);
        mMyModel.initData(5);
        this->rootContext()->setContextProperty("mTableModel", &mTableModel);
        this->rootContext()->setContextProperty("mMyModel", &mMyModel);
        setSource(url);
        //setSource后才能得到obj对象
        m_Obj  = this->rootObject();
        connect(m_Obj,SIGNAL(signalQmlOptions(QVariant,QString)),this,SLOT(slotRecevQmlReq(QVariant,QString)));
    }
}
///
/// \brief YbQuickView::slotRecevQmlReq
/// \param var
/// \param cmd
/// 接受来自QML的请求
///
void DDNewQuickWindow::slotRecevQmlReq(QVariant var, QString cmd)
{
    if(var.toString()=="system"){
        if(cmd == "close"){
            this->close();
            qApp->quit();
        }else if(cmd == "min"){
            this->showMinimized();
        }
    }

}
///
/// \brief DDNewQuickWindow::mouseDoubleClickEvent
/// \param event
/// 双击可最大化窗口和还原窗口大小
///
void DDNewQuickWindow::mouseDoubleClickEvent(QMouseEvent *event)
{
    QRect rect(10,2,this->width()-70,mHelper->titleHeight());

    if(event->button() == Qt::LeftButton && rect.contains(event->pos())) {
        if(!isMax){
            isMax = !isMax;
            slotShowMaxAndNormal(true);
            showMaximized();
            update();
        }else{
            isMax = !isMax;
            slotShowMaxAndNormal(false);
            showNormal();
            update();
        }
    }
    QQuickView::mouseDoubleClickEvent(event);
}
///
/// \brief YbQuickView::slotShowMaxAndNormal
/// \param showMax
///  你可以注册该方法到QML当中
void DDNewQuickWindow::slotShowMaxAndNormal(bool showMax)
{
    if(m_Obj){
        QVariant returnVal;
        QMetaObject::invokeMethod(m_Obj,"transToQml",Q_RETURN_ARG(QVariant,returnVal),
                                  Q_ARG(QVariant,showMax));
    }
}
