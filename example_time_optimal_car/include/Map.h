/**
 * @file Map.h
 * @author hazy parker
 * @brief to show map (use OpenCV for now, considering using Qt GUI in the future)
 * @version 0.1
 * @date 2022-12-11
 * 
 * This file tends to draw paths calculated by OpenCV,
 * the main challenge is the process of converting several path points(2D or 3D)
 * to some lines, which is difficult in grids
 * so there should contain a port to receive a series of points, then transfer them to lines on
 * a picture
 * 
 * refer: https://www.redblobgames.com/grids/line-drawing.html
 * Created by hazy parker on 22-12-9.
 */

#ifndef EXAMPLE_TIME_OPTIMAL_CAR_MAP_H
#define EXAMPLE_TIME_OPTIMAL_CAR_MAP_H

#include <opencv/cv.h>
#include <opencv4/opencv2/core.hpp>
#include <vector>

class Map{
public:
    // constructor function
    Map();

    // params about picture
    int resolution_rate;

    // params about path
    std::vector<std::pair<double, double>> init_path;
    std::vector<std::pair<double, double>> optimized_path;

    // test draw line
    void MapTest();
};

#endif //EXAMPLE_TIME_OPTIMAL_CAR_MAP_H
