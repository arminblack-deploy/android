#include "backend.h"
#include <QCryptographicHash>
#include <QString>
#include <QDebug>
#include <QClipboard>

Backend::Backend(QObject *parent) : QObject(parent)
{
    qDebug()<< "called" ;
}

void Backend::printSlot(QString str)
{
    if ( str == "$QSETENCMD5$" ) {
        ENCD = "md5" ;
    }

    if ( str == "$QSETENCSHA1$" ) {
        ENCD = "sha1" ;
    }

    if ( str != "" ) {
        HASHED = "" ;
        if ( ENCD == "md5" ) {
            HASHED = QString(QCryptographicHash::hash((str.toLocal8Bit()),QCryptographicHash::Md5).toHex());
        }
        if ( ENCD == "sha1" ) {
            HASHED = QString(QCryptographicHash::hash((str.toLocal8Bit()),QCryptographicHash::Sha1).toHex());
        }
        if ( HASHED != "" ) {
            setValret(HASHED);
        }
    }

}

void Backend::gethash(QString hsh)
{
    if ( hsh != "" ) {
        cp->setText(hsh);
    }
}

QString Backend::valret()
{
    return FAN ;
}

void Backend::setValret(QString value)
{
    FAN = value ;
    emit valretChanged();
}
