/*********************************************************************************
  *Copyright(C),2014-2019,www.heilqt.com
  *FileName(文件名):  frameless_helper
  *Author  (作者):    TobyYi(tanboy@heilqt.com)
  *Version (版本):    1.0.0
  *CreateDate(创建日期): 2017-05-18
  *FinishDate(完成日期): 2017-05-18
  *Description(描述):
     1.用于主要说明此程序文件完成的主要功能
     2.与其他模块或函数的接口、输出值、取值范围、含义及参数间的控制、顺序、独立及依赖关系

  *Others(其他内容说明):参考相关博客文章
       others
  *Function List(函数列表):
     1.主要函数列表，每条记录应包含函数名及功能简要说明

     2.
  *History(历史修订记录):
     1.Date: 修改日期
       Author:修改者
       Modification:修改内容简介

     2.

**********************************************************************************/

#ifndef FRAMELESS_HELPER_H
#define FRAMELESS_HELPER_H

#include <QObject>
#include <QWindow>

class QWidget;
class DDFramelessHelperPrivate;

class  DDFramelessHelper : public QObject
{
    Q_OBJECT

public:
    DDFramelessHelper(QObject *parent = 0);
    ~DDFramelessHelper();
    void activateOn(QWidget *topLevelWidget);
    void activateOnQmlWidget(QWindow *topLevelWidget);

    void removeFrom(QWidget *topLevelWidget);
    void removeQmlWidgetFrom(QWindow *topLevelWidget);


    void setWidgetMovable(bool movable);
    void setWidgetResizable(bool resizable);
    void setRubberBandOnMove(bool movable);
    void setRubberBandOnResize(bool resizable);
    void setBorderWidth(uint width);
    void setTitleHeight(uint height);
    bool widgetResizable();
    bool widgetMovable();
    bool rubberBandOnMove();
    bool rubberBandOnResisze();
    uint borderWidth();
    uint titleHeight();

protected:
    virtual bool eventFilter(QObject *obj, QEvent *event);

private:
    DDFramelessHelperPrivate *d;
};

#endif //FRAMELESS_HELPER_H
