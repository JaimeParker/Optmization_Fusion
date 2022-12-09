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
    // constructor function
    Model();

    // state variable
    double V;
    double x_pos;
    double y_pos;
    double course;
    // define boundaries
    double x_low, x_up;
    double y_low, y_up;
    double V_low, V_up;
    double course_low, course_up;
    // set boundaries
    /**
     * set boundary of position in 2-dimension (x and y)
     * @param x1 lower edge of x
     * @param x2 upper edge of x
     * @param y1 lower edge of y
     * @param y2 upper edge of y
     */
    void SetPositionBoundary(double x1, double x2, double y1, double y2);
    /**
     * set boundary of velocity and course
     * @param v1 lower edge of velocity
     * @param v2 upper edge of velocity
     * @param a1 lower edge of course
     * @param a2 upper edge of course
     */
    void SetVelocityVectorBoundary(double v1, double v2, double a1, double a2);

    // control variable
    double dV;
    double d_course;
    // define boundaries
    double dV_low, dV_up;
    double d_course_low, d_course_up;
    // set boundaries
    /**
     * set boundary for v_dot and course_dot
     * @param dV1 lower edge of dV
     * @param dV2 upper edge of dV
     * @param dc1 lower edge of d_course
     * @param dc2 upper edge of d_course
     */
    void SetControlBoundary(double dV1, double dV2, double dc1, double dc2);


};

#endif //EXAMPLE_TIME_OPTIMAL_CAR_MODEL_H
