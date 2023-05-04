#ifndef MAPWIDGET_H
#define MAPWIDGET_H

#include <QWidget>

class MapWidget : public QWidget
{
    Q_OBJECT
public:
    explicit MapWidget(QWidget *parent = nullptr);

    // return m_lastClickPos
    // get the last clicked pos from override function mousePressEvent
    QPoint getLastClickPos() const;

    QPoint getLastReleasePos() const;

signals:
    void mouseRelease(QPoint posirtion);

protected:
    // override mousePressEvent function
    // so that we can get the position from the private variable m_lastClickPos
    void mousePressEvent(QMouseEvent *event) override;

private:
    // QPoint, similar to int type
    // recode last clicked position of mapWidget in ui
    QPoint m_lastClickPos;

    // record last position of releasing left mouse button
    QPoint m_lastReleasePos;
};

#endif // MAPWIDGET_H
