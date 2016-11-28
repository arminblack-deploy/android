#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QClipboard>
#include <QGuiApplication>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString valret READ valret WRITE setValret NOTIFY valretChanged)
public:
    QString ENCD = "md5"                 ;
    QString HASHED                       ;
    QString FAN                          ;
    explicit Backend(QObject *parent = 0);
    QClipboard *cp = QGuiApplication::clipboard();
signals:
    void valretChanged();

public slots:
    void printSlot(QString str);
    void gethash(QString hsh);
    QString valret();
    void setValret(QString value);
};

#endif // BACKEND_H
