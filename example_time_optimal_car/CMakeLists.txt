cmake_minimum_required(VERSION 3.24)
project(example_time_optimal_car)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
#set(CMAKE_PREFIX_PATH ~/Apps/Qt/Tools/QtCreator/lib)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# find packages
find_package(Eigen3 REQUIRED)
find_package(OpenCV 4 QUIET)
if(NOT OpenCV_FOUND)
    message("OpenCV 4.x not found, searching OpenCV 2.4.3 now.")
    find_package(OpenCV 2.4.3 QUIET)
    if(NOT OpenCV_FOUND)
        message(FATAL_ERROR "OpenCV > 2.4.3 not found.")
    endif()
endif()
find_package(Pangolin REQUIRED)
find_package(Ceres REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Core REQUIRED)
find_package(Qt5Quick REQUIRED)

# include header file
include_directories(
        ${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/include
        ${EIGEN3_INCLUDE_DIR}
        ${Pangolin_INCLUDE_DIR}
)

# include source file
add_library(${PROJECT_NAME} SHARED
        src/Model.cc
        src/Map.cc
        )

# target link libraries
target_link_libraries(${PROJECT_NAME}
        ${EIGEN3_LIBS}
        ${OpenCV_LIBS}
        ${Pangolin_LIBRARIES}
        Qt5::Widgets
        )

# Examples
add_executable(test Examples/test.cc)
