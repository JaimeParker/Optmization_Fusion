//
// Created by hazy parker on 22-12-9.
//

#include <QApplication>
#include "Map.h"
#include <vector>
#include <utility>


Map::Map(std::vector<std::pair<double, double>> &path1,
         std::vector<std::pair<double, double>> &path2){
    // path1 should be the initial path
    // path2 should be the optimized path
    init_path = path1;
    optimized_path = path2;

    int argc;
    char **argv;
    QtVisualization(argc, argv);
}

int Map::QtVisualization(int argc, char **argv) {
    //TODO: To realize presenting both trajectories in one window
    QApplication qApplication(argc, argv);

    // init series
    auto *series = new QtCharts::QLineSeries();

    // set value
    for(auto & iter : init_path){
        series->append(iter.first, iter.second);
    }

    // init chart
    auto *chart = new QtCharts::QChart();
    chart->legend()->hide();
    chart->addSeries(series);
    chart->createDefaultAxes();
    chart->setTitle("Simple Map Example");

    // add chart view
    auto *chartView = new QtCharts::QChartView(chart);
    chartView->setRenderHint(QPainter::Antialiasing);

    // init main window
    QMainWindow window;
    window.setCentralWidget(chartView);
    window.resize(400, 400);
    window.show();
    return QApplication::exec();
}
