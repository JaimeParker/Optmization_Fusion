#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtCharts>
#include <utility>
#include "mapwidget.h"

using pos2d = std::pair<int, int>;
using vec2d = std::vector<std::vector<int>>;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    // constructor function
    MainWindow(QWidget *parent = nullptr);

    // destructor function
    ~MainWindow();

    // set map view of the QWidget
    void setMapWidget();

    // set map size
    void setMapSize(int size) {map_size = size;};

    // set thickness of grid line
    void setGridLineThick(double thick) {grid_line_thickness = thick;};

    // set thickness of path line
    void setPathLineThick(double thick) {path_line_thickness = thick;};

    // draw dynamic path
    void addDynamicPath(QVector<QPointF> &points, QPen pen, double interval);

    // initialize grid map
    void initializeMap();


private slots:
    // call when button execute is clicked
    void on_pushButton_Exe_clicked();

    // call when button set start is clicked
    void on_pushButton_setstart_clicked();

    // call when button set goal is clicked
    void on_pushButton_setGoal_clicked();

    // call when button set rect obstacle is clicked
    void on_pushButton_addRect_clicked();

private:
    // pointer to ui file
    Ui::MainWindow *ui;

    // scene for show
    QGraphicsScene *m_scene;

    // pointer of class MapWidget, used for link up with ui->mapWidget
    MapWidget *m_mapWidget;

    // map size, the map is set to be a square.
    // width = height
    int map_size = 500;

    // the thickness of line drawing the grid
    double grid_line_thickness = 0.5;

    // the thickness of line drawing the path
    double path_line_thickness = 1.0;

    // heading angle for start point
    int m_angle_start = 0;

    // heading angle for goal point
    int m_angle_goal = 0;

    // start point position
    pos2d m_start2d = {0, 0};

    // goal point position
    pos2d m_goal2d = {10, 10};

    // init grid map
    vec2d occupancy_grid_map;
//    vec2d aaa(map_size, std::vector<int>(map_size));
    // why is this wrong?

};
#endif // MAINWINDOW_Hi
