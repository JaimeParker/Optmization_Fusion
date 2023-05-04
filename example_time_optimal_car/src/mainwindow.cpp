#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include "mapwidget.h"
#include <opencv2/opencv.hpp>
#include "Astar2d.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    initializeMap();

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
//    QPen pen(Qt::black);
//    pen.setWidth(path_line_thickness);
//    m_scene->addLine(0, 0, 500, 500, pen);

    // Draw a rect example
//    QGraphicsRectItem *rectItem = new QGraphicsRectItem(50, 50, 100, 100);
//    rectItem->setPen(QPen(Qt::blue));
//    rectItem->setBrush(QBrush(Qt::blue));
//    m_scene->addItem(rectItem);

    // create a QGraphicsView to display the grid map
    auto *view = new QGraphicsView(m_scene);
    view->setRenderHint(QPainter::Antialiasing);
    view->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);

    // add the QGraphicsView to the mapWidget
//    QWidget *mapWidget = ui->mapWidget;
//    mapWidget->setLayout(layout);
    auto *layout = new QHBoxLayout();
    layout->addWidget(view);

    m_mapWidget = new MapWidget(ui->mapWidget);
    m_mapWidget->setLayout(layout);


    // dynamic path test
    QVector<QPointF> points;
    for (int x = 0; x < *size; x++){
        points.append(QPointF(x, x + 20 * sin(0.1 * x)));
    }
//    addDynamicPath(points, pen, 0.01);

}

void MainWindow::addDynamicPath(QVector<QPointF> &points, QPen pen, double interval)
{
    // Create a QGraphicsPathItem to hold the line
    auto *lineItem = new QGraphicsPathItem();
    lineItem->setPen(pen);
    m_scene->addItem(lineItem);

    QPainterPath path;

    // Create a list of points for the line
    int pointIndex = 0;
    auto *timer = new QTimer(this);
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

void MainWindow::initializeMap()
{
    // TODO: fix this stupid bug
    vec2d grid_map(map_size, std::vector<int>(map_size, 1));
    occupancy_grid_map = grid_map;
}


void MainWindow::on_pushButton_Exe_clicked()
{
    // this function is used to call main planning
    qDebug("developing, please stand by");

    // test map
    cv::Mat img = cv::Mat(map_size, map_size, CV_8UC1, cv::Scalar(0));
    for (int row = 0; row < img.rows; ++row) {
        for (int col = 0; col < img.cols; ++col) {
            img.at<uchar>(row, col) = occupancy_grid_map[row][col] * 255;
        }
    }
    cv::imshow("Image", img);
    cv::waitKey(0);

    pos2d start = {m_start2d.first, m_start2d.second};
    pos2d goal = {m_goal2d.first, m_goal2d.second};
    Astar2d astar2D_planner;
    astar2D_planner.setMap(occupancy_grid_map, map_size);
    astar2D_planner.setStart(start.first, start.second);
    astar2D_planner.setGoal(goal.first, goal.second);
    astar2D_planner.ConventionalAStar();
    std::vector<Pair> path = astar2D_planner.getPath();

    int length = astar2D_planner.getPathPointsNumber();
    if (length == 0){
        std::cout << "why length = 0?";
        exit(1);
    }
    QVector<QPointF> points = {QPointF(path[0].first, path[0].second)};
    for (int i = 0; i < length - 1; i++){
        points.append({double(path[i].first), double(path[i].second)});
        qDebug() << points[i];
    }
    QPen pen(Qt::black);
    addDynamicPath(points, pen, 0.01);
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

    // set status bar info
    auto *status = ui->statusbar;
    QString str_message = "start point set! ";
    status->showMessage(str_message + str + ", with heading angle of " + angle_str + " degrees.");
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

    // set status bar info
    auto *status = ui->statusbar;
    QString str_message = "goal point set! ";
    status->showMessage(str_message + str + ", with heading angle of " + angle_str + "degrees.");
}

void MainWindow::on_pushButton_addRect_clicked()
{
    qDebug("set rect button is clicked");

    QPoint left_up_pos = m_mapWidget->getLastClickPos();
    QPoint right_down_pos = m_mapWidget->getLastReleasePos();

    int rect_length = abs(left_up_pos.x() - right_down_pos.x());
    int rect_width = abs(left_up_pos.y() - right_down_pos.y());

    auto *rect = new QGraphicsRectItem(left_up_pos.x(), left_up_pos.y(),
                                   rect_length, rect_width);
    rect->setBrush(QBrush(Qt::blue));
    m_scene->addItem(rect);

    // set status bar info
    auto *status = ui->statusbar;
    status->showMessage("successfully added a rect obstacle!");

    // update map
    for (int i = left_up_pos.y() - 1; i < left_up_pos.y() - 1 + rect_width; i++){
        for (int j = left_up_pos.x() - 1; j < left_up_pos.x() - 1 + rect_length; j++){
            if (occupancy_grid_map[i][j] == 1) occupancy_grid_map[i][j] = 0;
        }
    }

}
