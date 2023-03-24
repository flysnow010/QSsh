# QSsh

#### Description
The QSsh library extracted from Qt Creator is an encapsulation of SSH and SCP command line programs.

#### Instructions

The following is the example code for using the QSsh library.

1.  Widget.h
```
#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <sshremoteprocessrunner.h>

QT_BEGIN_NAMESPACE
namespace Ui { class Widget; }
QT_END_NAMESPACE

class Widget : public QWidget
{
    Q_OBJECT
public:
    Widget(QWidget *parent = nullptr);
    ~Widget();
private slots:
    void connectionError();
    void processStarted();
    void readyReadStandardOutput();
    void readyReadStandardError();
    void processClosed(const QString &error);
    void on_pushButton_clicked();
private:
    Ui::Widget *ui;
    QSsh::SshRemoteProcessRunner * shell;
};
#endif // WIDGET_H
```
2.  Widget.cpp
```
#include "widget.h"
#include "ui_widget.h"
#include <sshconnectionmanager.h>
#include <sshsettings.h>

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
    , shell(new QSsh::SshRemoteProcessRunner(this))
{
    ui->setupUi(this);
    QSsh::SshSettings::setAskpassFilePath(
            Utils::FilePath::fromString("AskPass.exe"));
    connect(shell, SIGNAL(connectionError()), this, SLOT(connectionError()));
    connect(shell, SIGNAL(processStarted()), this, SLOT(processStarted()));
    connect(shell, SIGNAL(readyReadStandardOutput()), this, SLOT(readyReadStandardOutput()));
    connect(shell, SIGNAL(readyReadStandardError()), this, SLOT(readyReadStandardError()));
    connect(shell, SIGNAL(processClosed(QString)), this, SLOT(processClosed(QString)));
}

Widget::~Widget()
{
    delete ui;
}

void Widget::connectionError()
{
    qDebug() << "connectionError: " << shell->lastConnectionErrorString();
}

void Widget::processStarted()
{
    qDebug() << "processStarted";
}

void Widget::readyReadStandardOutput()
{
    QString text = ui->textEdit->toPlainText() + 
        QString::fromUtf8(shell->readAllStandardOutput());
    ui->textEdit->setText(text);
}

void Widget::readyReadStandardError()
{
    qDebug() << "readyReadStandardError:" 
        <<  QString::fromUtf8(shell->readAllStandardError());
}

void Widget::processClosed(const QString &error)
{
    qDebug() << "processClosed: " << error;
}

void Widget::on_pushButton_clicked()
{
    QSsh::SshConnectionParameters paramters;

    paramters.setHost("13.13.13.10");
    paramters.setUserName("james");
    paramters.setPort(22);

    shell->runInTerminal(QString(), paramters);
}
```
