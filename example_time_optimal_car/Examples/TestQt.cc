#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication qApplication(argc, argv);

    MainWindow w;
    w.show();

    return QApplication::exec();
}
