//
// Created by hazy parker on 22-12-8.
//

#include "Map.h"
// if this file is an exe file and used ${PROJECT_NAME} SHARED
// cpp and header files, ${PROJECT_NAME} need to be added after the file in CMakeList.txt

#include <utility>
#include <vector>

double func(double x){
    return sin(3.1415926 * x);
}

int main(){
    std::vector<std::pair<double, double>> test_path1;
    std::vector<std::pair<double, double>> test_path2;

    double x = 0;
    for (int iter = 0; iter <= 1000; iter++){
        test_path1.emplace_back(x, func(x));
        test_path2.emplace_back(x, func(x)+1);
        x += 0.01;
    }

    Map map(test_path1, test_path2);
    return 0;
}
