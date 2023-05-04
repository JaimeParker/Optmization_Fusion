//
// Created by hazy parker on 23-5-4.
//

#include "Astar2d.h"
#include <chrono>
#include <queue>


Astar2d::Astar2d() = default;

bool Astar2d::isValid(const Vec2d &grid_map, const Pair &test_pos) {
    // Returns true if row number and column number is in range
    if (m_row > 0 && m_col > 0)
        return (test_pos.first >= 0) && (test_pos.first < m_row)
               && (test_pos.second >= 0) && (test_pos.second < m_col);

    else return false;
}

void Astar2d::setMap(Vec2d &map, int map_size) {
    occupancy_grid_map = map;
    m_row = map_size;
    m_col = map_size;
}

bool Astar2d::isUnBlocked(const Vec2d &grid_map, const Pair &test_pos) {
    return isValid(grid_map, test_pos) && abs(grid_map[test_pos.first][test_pos.second] - 1) < 1e-6;
}

bool Astar2d::isDestination(const Pair &test_pos) {
    return test_pos == m_goal;
}

double Astar2d::calculateH(const Pair &src, const Pair &dest) {
    // h is estimated with the two points distance formula
    return sqrt(pow((src.first - dest.first), 2.0)
                + pow((src.second - dest.second), 2.0));
}

void Astar2d::ConventionalAStar() {
    std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();

    if (!isValid(occupancy_grid_map, m_start)){
        printf("Source is invalid\n");
        exit(0);
    }

    if (!isValid(occupancy_grid_map, m_goal)){
        printf("Destination is invalid\n");
        exit(1);
    }

    if (!isUnBlocked(occupancy_grid_map, m_start)
        || !isUnBlocked(occupancy_grid_map, m_goal)) {
        printf("Source or the destination is blocked\n");
        exit(2);
    }

    if (isDestination(m_start)) {
        printf("We are already at the destination\n");
        exit(3);
    }

    std::vector<std::vector <cell>> cellDetails(m_row, std::vector<cell>(m_col));

    int i, j;
    // Initialising the parameters of the starting node
    i = m_start.first, j = m_start.second;
    cellDetails[i][j].cost_f = 0.0;
    cellDetails[i][j].cost_g = 0.0;
    cellDetails[i][j].cost_h = 0.0;
    cellDetails[i][j].nodeParent = {i, j};

    // Create a closed list and initialise it to false
    bool closedList[m_row][m_col];
    memset(closedList, false, sizeof(closedList));

    /**
     * Create an open list having information as <f, <i, j>>
     * where f = g + h,
     * and i, j are the row and column index of that cell
     * Note that 0 <= i <= ROW-1 & 0 <= j <= COL-1
     * This open list is implemented as a set of tuple
     */
    std::priority_queue<Tuple, std::vector<Tuple>, std::greater<> > openList;

    openList.emplace(0.0, i, j);
    while(!openList.empty()){
        const Tuple& p = openList.top(); // first time, it will be start point
        // Add this vertex to the closed list
        i = std::get<1>(p); // second element of tuple
        j = std::get<2>(p); // third element of tuple

        // remove this vertex from open list and send it to close list
        openList.pop();
        closedList[i][j] = true;

        Vec2d grid(m_row, std::vector<int>(m_col));
        grid = occupancy_grid_map;
        for (int add_x = -1; add_x <= 1; add_x++) {
            for (int add_y = -1; add_y <= 1; add_y++) {

                Pair neighbour(i + add_x, j + add_y);

                if (!isValid(grid, neighbour)){
                    continue;
                }
                if (isDestination(neighbour)){
                    // set parent of destination cell
                    cellDetails[neighbour.first][neighbour.second].nodeParent = {i, j};
                    // print path
                    std::cout << "destination is found!" << std::endl;
                    TracePath(cellDetails);
                    // set end time and show
                    std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
                    std::chrono::duration<double> time_used =
                            std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t1);
                    std::cout << "solve time cost = " << time_used.count() << " seconds. " << std::endl;
                    // end
                    return;
                }
                else if (!closedList[neighbour.first][neighbour.second]
                         && isUnBlocked(grid, neighbour)){

                    // update weight values
                    double f_updated, g_updated, h_updated;
                    g_updated = cellDetails[i][j].cost_g + sqrt(pow(add_x, 2.0) + pow(add_y, 2.0));
                    h_updated = calculateH(neighbour, m_goal);
                    f_updated = g_updated + h_updated;

                    // send less f_updated to open list
                    double temp_cost_f = cellDetails[neighbour.first][neighbour.second].cost_f;
                    if (f_updated < temp_cost_f || temp_cost_f == -1){
                        // -1 referring that this node doesn't belong to open list, shall be added in
                        // f_updated is less, shall be added in open list
                        // at first I was concerning about the StartPoint, then I just realized that
                        // StartPoint has been thrown into close list
                        openList.emplace(f_updated, neighbour.first, neighbour.second);

                        // update cost f, g, h and parent node of cellDetails
                        cellDetails[neighbour.first][neighbour.second].cost_f = f_updated;
                        cellDetails[neighbour.first][neighbour.second].cost_g = g_updated;
                        cellDetails[neighbour.first][neighbour.second].cost_h = h_updated;
                        // set parent of successors(not in Close list and is unblocked)
                        cellDetails[i + add_x][j + add_y].nodeParent = {i, j};
                    }

                }
//                std::cout << "original: " << i << ", " << j << std::endl;
//                std::cout << "position: " << neighbour.first << ", " << neighbour.second << std::endl;
//                if (isValid(grid, neighbour)) std::cout << "Valid" << std::endl;
//                else std::cout << "Invalid" << std::endl;
//                if (isUnBlocked(grid, neighbour)) std::cout << "Unblocked" << std::endl;
//                else std::cout << "Blocked" << std::endl;
//                if (closedList[neighbour.first][neighbour.second]) std::cout << "Closed" << std::endl;
//                else std::cout << "Open" << std::endl;
//                std::cout << std::endl;


            }

        }

    }

}

void Astar2d::TracePath(const std::vector<std::vector <cell>> &cellDetails) {
    int i = m_goal.first;
    int j = m_goal.second;
    Pair temp_node;

    while(cellDetails[i][j].nodeParent != m_start){
        m_reverse_path.emplace(i, j);
        temp_node = cellDetails[i][j].nodeParent;
        // i = cellDetails[i][j].nodeParent.first is illegal!
        i = temp_node.first;
        j = temp_node.second;
    }
    m_reverse_path.emplace(i, j);
    // push StartPoint into Stack
    m_reverse_path.emplace(m_start);

    while(!m_reverse_path.empty()){
        Pair p = m_reverse_path.top();
        m_reverse_path.pop();
        m_path.emplace_back(p);
        m_points_number += 1;
    }
}

