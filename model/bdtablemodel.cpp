#include "bdtablemodel.h"
#include <QDebug>

BDTableModel::BDTableModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    mObjDataList.clear();
    //    initData();
}

void BDTableModel::initData(int count)
{
    if(count <0)return;
    for(int i=0;i<count;i++){
        BDTableInfo info;
        info.dessert = QString("desser (%1)").arg(i);
        info.type = QString("type (%1)").arg(i+11);
        info.flat = QString("flat (%1)").arg(i+21);
        info.carbs = QString("carbs (%1)").arg(i+1);
        info.checked  = (i%2 == 0);
        BDTableObject obj(info);
        addDataList(obj);
    }
}

void BDTableModel::addDataList(const QList<BDTableObject> &list)
{
    mObjDataList.append(list);
}

void BDTableModel::addDataList(const BDTableObject &listStu)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    mObjDataList << listStu;
    endInsertRows();
}

void BDTableModel::addRowData(int row, const BDTableObject &data)
{
    if(row < 0 || row > mObjDataList.size()-1)return;
    mObjDataList.insert(row,data);
    insertRows(row,1,this->index(0,0).parent());
}

void BDTableModel::removeRowData(int row)
{
    if(row <0 || row > mObjDataList.size()-1)return;
    mObjDataList.removeAt(row);
    removeRows(row,1,this->index(0,0).parent());
}

int BDTableModel::rowCount(const QModelIndex &parent) const
{
    //    if (!parent.isValid())
    //        return 0;
    return mObjDataList.size();
    // FIXME: Implement me!
}

int BDTableModel::columnCount(const QModelIndex &parent) const
{
    return 6;
    // FIXME: Implement me!
}

QVariant BDTableModel::data(const QModelIndex &index, int role) const
{
    //    qDebug()<<Q_FUNC_INFO<<role<<" index " <<index;
    if (!index.isValid() || rowCount() < index.row() || index.row() < 0)
        return QVariant();
    BDTableObject obj = mObjDataList[index.row()];
    //    qDebug()<<Q_FUNC_INFO<<role<<" index " <<index;
    switch (role) {
    case FIRST:
        return obj.dessert();
    case SECONDE:
        return obj.type();
    case THREE:
        return obj.flat();
    case FOUR:
        return obj.carbs();
    case FIVE:
        return obj.checked();
    case SIX:
        return obj.comboxLst();
    default:
        break;
    }
    return QVariant();
}


bool BDTableModel::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endInsertRows();
    return true;
}

bool BDTableModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> BDTableModel::roleNames() const
{
    QHash<int, QByteArray> hashData;
    hashData.insert(FIVE,"checked");
    hashData.insert(FIRST,"dessert");
    hashData.insert(SECONDE,"dbtype" );
    hashData.insert(THREE,"flat" );
    hashData.insert(FOUR,"carbs" );
    hashData.insert(SIX,"comboLst" );
    return hashData;
}


QStringList BDTableModel::userRoleNames()
{
    QMap<int, QString> res;
    QHashIterator<int, QByteArray> i(roleNames());
    while (i.hasNext()) {
        i.next();
//        if(i.key() > Qt::UserRole)
            res[i.key()] = i.value();
    }
    return res.values();
}
