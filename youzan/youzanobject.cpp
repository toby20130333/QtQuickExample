/*********************************************************************************
  *Copyright(C),2014-2016,www.heilqt.com
  *FileName(文件名):  youzanapi
  *Author  (作者):    TobyYi(https://github.com/toby20130333)
  *Version (版本):    1.0.0
  *CreateDate(创建日期):
  *FinishDate(完成日期):
  *Description(描述):
     1.用于主要说明此程序文件完成的主要功能
     2.与其他模块或函数的接口、输出值、取值范围、含义及参数间的控制、顺序、独立及依赖关系

  *Others(其他内容说明):
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
#include "youzanobject.h"
#include <QPrinter>
#include <QPrintDialog>
#include <QDebug>

YouZanObject::YouZanObject(QObject *parent) : QObject(parent)
{
    mUseImg=true;
}

int YouZanObject::getCurrentPage() const {
    return mCurrentPage;
}

void YouZanObject::slotSetcurrentPage(int curpage)
{
    if(curpage == -1)return;
    mCurrentPage = curpage;
}

void YouZanObject::slotSetUseImagePrinf(bool use)
{
    if(mUseImg != use)
        mUseImg = use;
    qDebug()<<"-------prinfImage----------"<<mUseImg;

}
///
/// \brief YouZanObject::doPrint
/// 开始打印被选中的订单内容
void YouZanObject::doPrint()
{    // 创建打印机对象
    QPrinter printer;
    // 创建打印对话框
    QString printerName = printer.printerName();
    if( printerName.size() == 0)
        return;
    QPrintDialog dlg(&printer);
    // 如果在对话框中按下了打印按钮，则执行打印操作
    qDebug()<<"-------prinfImage-22---------"<<mUseImg;
    if(mUseImg){
        qDebug()<<"图片打印: 需要打印的图片列表:"<<mImageList;
    }else{
        qDebug()<<"富文本打印:  需要打印的图片列表Size:"<<mHtmlList.size();
    }
    if (dlg.exec() == QDialog::Accepted)
    {
        if(mUseImg){
            if(mImageList.isEmpty())return;
            for(int i=0;i<mImageList.size();i++){
                prinfImage(mImageList.at(i));
            }
        }else{
            if(mHtmlList.isEmpty())return;
            for(int i=0;i<mHtmlList.size();i++){
                printString(mHtmlList.at(i));
            }
        }
    }
}
///
/// \brief YouZanObject::openPrinfDialog
/// \param isOpen
/// 从QML打开打印界面
void YouZanObject::openPrinfDialog(bool isOpen)
{
    if(isOpen){
        doPrint();
    }
}
void YouZanObject::printString(const QString &htmlString) {
    qDebug() << htmlString;
    QPrinter p;
    QTextDocument doc;
    QFont font = doc.defaultFont();
    font.setBold(true);
    font.setPointSize(font.pointSize() + 1);
    doc.setDefaultFont(font);

    QSizeF s = QSizeF(p.logicalDpiX() * (58 / 25.4), p.logicalDpiY() * (297 / 25.4));
    doc.setPageSize(s);

    p.setOutputFormat(QPrinter::NativeFormat);
    // 打yin内容
    doc.setHtml(htmlString);
    doc.print(&p);
    emit signalPrintFinished();
}

///
/// \brief YouZanObject::prinfImage
/// \param imgpath
///  直接打印图片
void YouZanObject::prinfImage(const QString &imgpath)
{
    qDebug()<<"-------prinfImage----------"<<imgpath;
    QPrinter printer;
    QImage image(imgpath);
    QPainter painter(&printer);
    QRect rect = painter.viewport();
    QSize size = image.size();
    size.scale(rect.size(), Qt::KeepAspectRatio);
    painter.setViewport(rect.x(), rect.y(),
                        size.width(), size.height());
    painter.setWindow(image.rect());
    painter.drawImage(0, 0, image);
}

void YouZanObject::setCurrentPrintContents(const QString &html)
{
    if(mHtmlList.contains(html))return;
    mHtmlList.append(html);
    qDebug()<<"setCurrentPrintContents "<<mHtmlList.size();
}

void YouZanObject::setCurrentPrintImage(const QString &html)
{
    if(mImageList.contains(html))return;
    mImageList.append(html);
    qDebug()<<"setCurrentPrintImage "<<html;
}
