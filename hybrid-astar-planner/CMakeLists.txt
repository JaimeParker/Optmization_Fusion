cmake_minimum_required(VERSION 3.24)
project(hybrid_astar_planner)

set(CMAKE_CXX_STANDARD 17)

find_package(OpenCV REQUIRED)

include_directories(${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/include
        ${OpenCV_INCLUDE_DIR})

add_library(${PROJECT_NAME} SHARED
        src/Compare.cpp
        src/Gui.cpp
        src/Map.cpp
        src/Planner.cpp
        src/State.cpp)

add_executable(astar test.cpp
        src/Compare.cpp
        src/Gui.cpp
        src/Map.cpp
        src/Planner.cpp
        src/State.cpp)

target_link_libraries(astar ${OpenCV_LIBS}
        ${PROJECT_NAME})
