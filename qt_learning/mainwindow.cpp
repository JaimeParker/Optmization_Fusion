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
    QGraphicsScene *scene = new QGraphicsScene(this);
    int *size = &map_size;
    scene->setSceneRect(0, 0, *size, *size);

    // create the grid map
    int grid_size = 5;
    for (int x = 0; x <= scene->width(); x += grid_size) {
        scene->addLine(x, 0, x, scene->height(), QPen(Qt::gray, grid_line_thickness));
    }
    for (int y = 0; y <= scene->height(); y += grid_size) {
        scene->addLine(0, y, scene->width(), y, QPen(Qt::gray, grid_line_thickness));
    }

    // Draw a line example
    QPen pen(Qt::black);
    pen.setWidth(path_line_thickness);
    scene->addLine(0, 0, 500, 500, pen);

    // Draw a rect example
    QGraphicsRectItem *rectItem = new QGraphicsRectItem(50, 50, 100, 100);
    rectItem->setPen(QPen(Qt::blue));
    rectItem->setBrush(QBrush(Qt::blue));
    scene->addItem(rectItem);

    // Draw a dynamic line example
    QGraphicsLineItem *lineItem = new QGraphicsLineItem();
    lineItem->setPen(pen);
    scene->addItem(lineItem);

//    QVector<QPointF> points = {QPointF(10,10), QPointF(50,100), QPointF(200,50), QPointF(400,400)};

    QTimer timer;
    // Set a timeout for the timer (in milliseconds)
//    timer->setSingleShot(true);
    timer.setInterval(1000); // 1000ms = 1 second

    // Connect the timeout signal to a slot function
    connect(&timer, &QTimer::timeout, this, [=]() {
        // This code will be executed after the delay has passed
        qDebug() << "Delay is over!";

    });

    // Start the timer
    timer.start();

    // create a QGraphicsView to display the grid map
    QGraphicsView *view = new QGraphicsView(scene);
    view->setRenderHint(QPainter::Antialiasing);
    view->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);

    // add the QGraphicsView to the mapWidget
    QWidget *mapWidget = ui->mapWidget;
    QHBoxLayout *layout = new QHBoxLayout();
    layout->addWidget(view);
    mapWidget->setLayout(layout);

}

void MainWindow::setTimeInterval(double seconds)
{
    m_timer.setInterval(1000 * seconds);
}
