#include <QApplication>
#include <QtWidgets/QMainWindow>
#include <QtCharts/QChartView>
#include <QtCharts/QtCharts>
#include <QtCharts/QLineSeries>

//using namespace QtCharts;

int main(int argc, char *argv[])
{
//    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();

    // get resolution of screen
    QRect mRect;
    mRect = QGuiApplication::primaryScreen()->geometry();
    qDebug() << "width:" << mRect.width() << ",height:" << mRect.height();
    int half_mWidth = mRect.width() / 2;
    int half_mHeight = mRect.height() / 2;

    QApplication qApplication(argc, argv);

    // Qt charts
    QtCharts::QLineSeries *series = new QtCharts::QLineSeries();

    series->append(0, 6);
    series->append(2, 4);
    series->append(3, 8);
    series->append(7, 4);
    series->append(10, 5);
    *series << QPointF(11, 1) << QPointF(13, 3) << QPointF(17, 6) << QPointF(18, 3) << QPointF(20, 2);

    QtCharts::QChart *chart = new QtCharts::QChart();
    chart->legend()->hide();
    chart->addSeries(series);
    chart->createDefaultAxes();
    chart->setTitle("Simple line chart example");

    QtCharts::QChartView *chartView = new QtCharts::QChartView(chart);
    chartView->setRenderHint(QPainter::Antialiasing);

    // Qt main window
    QMainWindow window;

//    QWidget *centralWidget = new QWidget;
//    window.setCentralWidget(centralWidget);
    window.setCentralWidget(chartView);



    window.resize(half_mWidth, half_mHeight);
    window.show();
    return qApplication.exec();
}
