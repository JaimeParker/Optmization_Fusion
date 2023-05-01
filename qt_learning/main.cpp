#include "mainwindow.h"

#include <QApplication>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMainWindow>
#include <QtCharts/QChartView>
#include <QtCharts/QtCharts>
#include <QtCharts/QLineSeries>

int main(int argc, char *argv[])
{
    QApplication qApplication(argc, argv);

    MainWindow w;
    w.show();

    return qApplication.exec();
}
