//
// Created by hazy parker on 23-5-4.
//

#include "Astar2d.h"

int main(){
    Astar2d astar2D;
    std::vector<std::vector<int>> grid(10, std::vector<int>(10, 1));

    grid[1][3] = 0;
    grid[2][3] = 0;
    grid[3][3] = 0;
    grid[4][3] = 0;
    grid[5][3] = 0;
    grid[6][3] = 0;
    for (int i = 0; i < 10; i ++){
        for (int j = 0; j < 10; j ++){
            std::cout << grid[i][j] << " ";
        }
        std::cout << std::endl;
    }
    astar2D.setMap(grid, 10);
    astar2D.setStart(0, 0);
    astar2D.setGoal(0, 2);
    astar2D.ConventionalAStar();
    std::vector<std::pair<int, int>> path =  astar2D.getPath();

    std::cout << "end";
    return 0;
}