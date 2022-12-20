#include "src/mainwindow.h"

#include <QApplication>
#include <QtCharts/QLineSeries>
#include <QtCharts/QChart>
#include <QtCharts/QChartView>

#include <vector>
#include <cmath>
#include <iostream>

double func(double x){
    return sin(3.1415926 * x);
}

void test_vector(std::vector<int> &vec){
    std::cout << "vector performs normally";
}

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    auto *series = new QtCharts::QLineSeries();

    // two methods to set series
    // series->append(0, 6);
    // *series << QPointF(11, 1);

    double x = 0;
    for (int iter = 0; iter <= 1000; iter++){
        series->append(x, func(x));
        x += 0.01;
    }

    std::vector<int> vector;
    test_vector(vector);

    auto *chart = new QtCharts::QChart();
    chart->legend()->hide();
    chart->addSeries(series);
    chart->createDefaultAxes();
    chart->setTitle("Simple line chart example");

    auto *chartView = new QtCharts::QChartView(chart);
    chartView->setRenderHint(QPainter::Antialiasing);

    QMainWindow window;
    window.setCentralWidget(chartView);
    window.resize(400, 400);
    window.show();
    return QApplication::exec();
}
