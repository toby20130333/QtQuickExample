#include "youzanobject.h"
#include <QPrinter>
#include <QPrintDialog>
#include <QDebug>

YouZanObject::YouZanObject(QObject *parent) : QObject(parent)
{

}

int YouZanObject::getCurrentPage() const {
    return mCurrentPage;
}

void YouZanObject::slotSetcurrentPage(int curpage)
{
    if(curpage == -1)return;
    mCurrentPage = curpage;
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
    if (dlg.exec() == QDialog::Accepted)
    {
        if(mHtmlList.isEmpty())return;
        for(int i=0;i<mHtmlList.size();i++){
            printString(mHtmlList.at(i));
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

void YouZanObject::setCurrentPrintContents(const QString &html)
{
    if(mHtmlList.contains(html))return;
    mHtmlList.append(html);
}
