#include "mainwindow.h"

#include <QApplication>
#include <QtWidgets/QMainWindow>

int main(int argc, char *argv[])
{
    QApplication qApplication(argc, argv);

    MainWindow w;
    w.show();

    return qApplication.exec();
}
