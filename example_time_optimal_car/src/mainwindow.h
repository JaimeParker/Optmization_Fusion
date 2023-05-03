#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtCharts>

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

private:
    // pointer to ui file
    Ui::MainWindow *ui;

    // scene for show
    QGraphicsScene *m_scene;

    // map size, the map is set to be a square.
    // width = height
    int map_size = 500;

    // the thickness of line drawing the grid
    double grid_line_thickness = 0.5;

    // the thickness of line drawing the path
    double path_line_thickness = 1.0;

};
#endif // MAINWINDOW_H
