#ifndef BDTABLEMODEL_H
#define BDTABLEMODEL_H

#include <QAbstractTableModel>
typedef struct tagBDTableInfo{
    QString dessert;
    QString type;
    QString flat;
    QString carbs;
    bool      checked;
    QStringList comBoxList;
    tagBDTableInfo(){
        checked = false;
        comBoxList.clear();
        comBoxList<<"111"<<"2222"<<"3333444"<<"54"<<"65";
    }
}BDTableInfo;

enum BDTableEnum{
    FIRST = 0x00000,
    SECONDE,
    THREE,
    FOUR,
    FIVE,
    SIX
};

class BDTableObject
{
public:
    BDTableObject(){}
    BDTableObject(const BDTableObject& other):
        m_dessert(other.dessert())
      ,m_type(other.type())
      ,m_flat(other.flat())
      ,m_carbs(other.carbs())
      ,m_checked(other.checked())
      ,m_comboxLst(other.comboxLst())
    {

    }

    BDTableObject(const BDTableInfo& info):
        m_dessert(info.dessert)
      ,m_type(info.type)
      ,m_flat(info.flat)
      ,m_carbs(info.carbs)
      ,m_checked(info.checked)
      ,m_comboxLst(info.comBoxList)
    {

    }

    QString dessert() const{return m_dessert;}
    QString type() const{return m_type;}
    QString flat() const{return m_flat;}
    QString carbs() const{return m_carbs;}
    QStringList comboxLst() const{return m_comboxLst;}
    bool checked() const{return m_checked;}

    void setDessert(const QString& dessert){m_dessert = dessert;}
    void setType(const QString& type){m_type = type;}
    void setFlat(const QString& flat){m_flat = flat;}
    void setCarbs(const QString& carbs){m_carbs = carbs;}
    void setComboxLst(const QStringList& cmLst){m_comboxLst = cmLst;}
    void setChecked(const bool& checked){m_checked = checked;}
private:
    QString m_dessert;
    QString m_type;
    QString m_flat;
    QString m_carbs;
    QStringList m_comboxLst;
    bool      m_checked;
};

class BDTableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit BDTableModel(QObject *parent = 0);
    Q_INVOKABLE void initData(int count = 5);
    void addDataList(const QList<BDTableObject>& list);
    void addDataList(const BDTableObject& listStu);

    void addRowData(int row,const BDTableObject& data);
    void removeRowData(int row);
    // Basic functionality:
    Q_INVOKABLE  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    // Add data:
    bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    // Remove data:
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    virtual QHash<int,QByteArray> roleNames() const;
    Q_INVOKABLE QStringList userRoleNames();

private:
    QList<BDTableObject> mObjDataList;
};

#endif // BDTABLEMODEL_H
