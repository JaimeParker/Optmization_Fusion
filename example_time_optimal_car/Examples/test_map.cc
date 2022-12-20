//
// Created by hazy parker on 22-12-8.
//

#include "Map.h"
#include <utility>
#include <vector>

double func(double x){
    return sin(3.1415926 * x);
}

int main(){
    std::vector<std::pair<double, double>> test_path1;
    std::vector<std::pair<double, double>> test_path2;

    std::vector<int> vector;
    vector.push_back(1);

    double x = 0;
    for (int iter = 0; iter <= 1000; iter++){
        test_path1.emplace_back(x, func(x));
        test_path2.emplace_back(x, func(x)+1);
        x += 0.01;
    }

//    Map::test_vector(test_path1);
    Map::test_again(vector);

//    Map map(test_path1, test_path2);
    return 0;
}
