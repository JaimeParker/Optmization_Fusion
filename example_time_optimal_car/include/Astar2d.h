//
// Created by hazy parker on 23-5-4.
//

#ifndef EXAMPLE_TIME_OPTIMAL_CAR_ASTAR2D_H
#define EXAMPLE_TIME_OPTIMAL_CAR_ASTAR2D_H

#include <tuple>
#include <vector>
#include <utility>
#include <stack>
#include <opencv2/opencv.hpp>

using Pair =  std::pair<int, int>;
using Vec2d =  std::vector<std::vector<int>>;
using Tuple = std::tuple<double, int, int>;
using PathVar =  std::tuple<bool, int, int, int>;

class Astar2d {
public:
    Astar2d();

    // A structure to hold the necessary parameters
    struct cell {
        // Row and Column index of its parent
        Pair nodeParent;
        // f = g + h
        double cost_f, cost_g, cost_h;
        cell():
                nodeParent(-1, -1), cost_f(-1), cost_g(-1), cost_h(-1){}
    };

    void setStart(int x, int y) {m_start = {x, y};}

    void setGoal(int x, int y) {m_goal = {x, y};}

    void setMap(Vec2d &map, int map_size);

    bool isValid(const Vec2d &grid_map, const Pair& test_pos);

    bool isUnBlocked(const Vec2d &grid_map, const Pair& test_pos);

    bool isDestination(const Pair &test_pos);

    static double calculateH(const Pair &src, const Pair &dest);

    void ConventionalAStar();

    void TracePath(const std::vector<std::vector <cell>> &cellDetails);

    std::vector<Pair> getPath() {return m_path;}

    [[nodiscard]] int getPathPointsNumber() const {return m_points_number;}




private:
    Pair m_start;
    Pair m_goal;

    Vec2d occupancy_grid_map;

    int m_row{};
    int m_col{};

    std::stack<Pair> m_reverse_path;
    std::vector<Pair> m_path;

    int m_points_number = 0;

};


#endif //EXAMPLE_TIME_OPTIMAL_CAR_ASTAR2D_H
