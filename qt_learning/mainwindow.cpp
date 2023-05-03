#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include "mapwidget.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // set mapWidget content
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
//    QWidget *mapWidget = ui->mapWidget;
//    mapWidget->setLayout(layout);
    QHBoxLayout *layout = new QHBoxLayout();
    layout->addWidget(view);

    m_mapWidget = new MapWidget(ui->mapWidget);
    m_mapWidget->setLayout(layout);


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


void MainWindow::on_pushButton_Exe_clicked()
{
    // this function is used to call main planning
    qDebug("developing, please stand by");
}


void MainWindow::on_pushButton_setstart_clicked()
{
    qDebug("set start button is clicked!");

    // get clicked pos and show
    QPoint lastClickPos = m_mapWidget->getLastClickPos();
    m_start2d.first = lastClickPos.x();
    m_start2d.second = lastClickPos.y();
    qDebug() << "in SLOT start, Last click position:" << lastClickPos;
    QString str = QString("(%1, %2)").
            arg(QString::number(lastClickPos.x()), QString::number(lastClickPos.y()));
    QLabel *label_start = ui->label_start;
    label_start->setText(str);

    // get info from plain text edit
    QPlainTextEdit *m_textEdit = ui->plainTextEdit_start;
    QString angle_str = m_textEdit->toPlainText();
    qDebug() << "get from plaintext(start):" << angle_str;
    m_angle_start = angle_str.toInt();
}


void MainWindow::on_pushButton_setGoal_clicked()
{
    qDebug("set goal button is clicked!");

    // get clicked pos and show
    QPoint lastClickPos = m_mapWidget->getLastClickPos();
    m_goal2d.first = lastClickPos.x();
    m_goal2d.second = lastClickPos.y();
    qDebug() << "in SLOT goal, Last click position:" << lastClickPos;
    QString str = QString("(%1, %2)").
            arg(QString::number(lastClickPos.x()), QString::number(lastClickPos.y()));
    QLabel *label_goal = ui->label_goal;
    label_goal->setText(str);

    // get info from plain text edit
    QPlainTextEdit *m_textEdit = ui->plainTextEdit_start;
    QString angle_str = m_textEdit->toPlainText();
    qDebug() << "get from plaintext(goal):" << angle_str;
    m_angle_goal = angle_str.toInt();
}

