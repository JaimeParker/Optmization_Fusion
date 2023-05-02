#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    setMapWidget();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setMapWidget()
{
    // create a QGraphicsScene to hold the grid map
    m_scene = new QGraphicsScene(this);
    int *size = &map_size;
    m_scene->setSceneRect(0, 0, *size, *size);

    // create the grid map
    int grid_size = 5;
    for (int x = 0; x <= m_scene->width(); x += grid_size) {
        m_scene->addLine(x, 0, x, m_scene->height(), QPen(Qt::gray, grid_line_thickness));
    }
    for (int y = 0; y <= m_scene->height(); y += grid_size) {
        m_scene->addLine(0, y, m_scene->width(), y, QPen(Qt::gray, grid_line_thickness));
    }

    // Draw a line example
    QPen pen(Qt::black);
    pen.setWidth(path_line_thickness);
    m_scene->addLine(0, 0, 500, 500, pen);

    // Draw a rect example
    QGraphicsRectItem *rectItem = new QGraphicsRectItem(50, 50, 100, 100);
    rectItem->setPen(QPen(Qt::blue));
    rectItem->setBrush(QBrush(Qt::blue));
    m_scene->addItem(rectItem);

    // create a QGraphicsView to display the grid map
    QGraphicsView *view = new QGraphicsView(m_scene);
    view->setRenderHint(QPainter::Antialiasing);
    view->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);

    // add the QGraphicsView to the mapWidget
    QWidget *mapWidget = ui->mapWidget;
    QHBoxLayout *layout = new QHBoxLayout();
    layout->addWidget(view);
    mapWidget->setLayout(layout);

    // dynamic path test
    QVector<QPointF> points;
    for (int x = 0; x < *size; x++){
        points.append(QPointF(x, x + 20 * sin(0.1 * x)));
    }
    addDynamicPath(points, pen, 0.01);

}

void MainWindow::addDynamicPath(QVector<QPointF> &points, QPen pen, double interval)
{
    // Create a QGraphicsPathItem to hold the line
    QGraphicsPathItem *lineItem = new QGraphicsPathItem();
    lineItem->setPen(pen);
    m_scene->addItem(lineItem);

    QPainterPath path;

    // Create a list of points for the line
    int pointIndex = 0;
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, [=]() mutable {
        if (pointIndex < points.size() - 1) {
            QPointF startPoint = points[pointIndex];
            QPointF endPoint = points[pointIndex + 1];
            path.lineTo(endPoint);
            lineItem->setPath(path);
            pointIndex++;
        } else {
            timer->stop();
            qDebug("timer stopped");
        }
    });
    path.moveTo(points[0]);
    timer->start(1000 * interval);
}
