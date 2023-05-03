#include "mapwidget.h"
#include <QMouseEvent>
#include <QDebug>

MapWidget::MapWidget(QWidget *parent)
    : QWidget{parent}
{
    setMouseTracking(true);
}

QPoint MapWidget::getLastClickPos() const
{
    return m_lastClickPos;
}

void MapWidget::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton){
        QPoint pos = event->pos();
        m_lastClickPos = pos;
        qDebug() << "mouse press event, clicked at:" << pos;
    }
}
