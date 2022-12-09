//
// Created by hazy parker on 22-12-8.
//

#include "Model.h"

Model::Model() {
    // define state and control variables
    V = 0;
    dV = 0;
    d_course = 0;
    x_pos = 0;
    y_pos = 0;
    course = 0;

    // define default boundaries
    x_low = 0;
    x_up = 100;
    y_low = 0;
    y_up = 100;
    V_low = 0;
    V_up = 30;
    course_low = -1.5;
    course_up = 1.5;

    dV_low = -5;
    dV_up = 5;
    d_course_low = -0.1;
    d_course_up = 0.1;
}

void Model::SetPositionBoundary(double x1, double x2, double y1, double y2) {
    x_low = x1;
    x_up = x2;
    y_low = y1;
    y_up = y2;
}

void Model::SetVelocityVectorBoundary(double v1, double v2, double a1, double a2) {
    V_low = v1;
    V_low = v2;
    course_low = a1;
    course_up = a2;
}

void Model::SetControlBoundary(double dV1, double dV2, double dc1, double dc2) {
    dV_low = dV1;
    dV_up = dV2;
    d_course_low = dc1;
    d_course_up = dc2;
}
