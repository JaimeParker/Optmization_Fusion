/**
 * Usage: Modelling a car in 2 Dimension, including it's state variables and control variables.
 *
 * State variables: this group should contains velocity, position, and control params of the vehicle.
 * x_position: position of vehicle in coordinate x.
 * y_position: position of vehicle in coordinate y.
 * course angle: in navigation, the course of a watercraft or aircraft is the cardinal direction
 * in which the craft is to be steered, could equal to the direction of velocity here
 * V: absolute velocity of the vehicle
 *
 * Control variables: this group contains acceleration param and angular velocity param.
 * V_dot_cmd: the absolute velocity of the vehicle, namely gas pedal input for cars in reality.
 * course angle_dot_cmd: the angular velocity of the car, namely steering wheel input in reality.
 *
 * Function: provide an object from class Model that can be used in a trajectory optimization problem.
 *
 * Created by hazy parker on 22-12-8.
 */

#ifndef EXAMPLE_TIME_OPTIMAL_CAR_MODEL_H
#define EXAMPLE_TIME_OPTIMAL_CAR_MODEL_H

// include libs

class Model{
public:
    Model();
    double V;
    double x_pos;
    double y_pos;
    double course;
    double dV_cmd;
    double d_course_cmd;
};

#endif //EXAMPLE_TIME_OPTIMAL_CAR_MODEL_H
