cmake_minimum_required(VERSION 3.21)
project(example_time_optimal_car)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# find packages
find_package(Eigen3 REQUIRED)
find_package(OpenCV 4 QUIET)
if(NOT OpenCV_FOUND)
    message("OpenCV 4.x not found, searching OpenCV 3 now.")
    find_package(OpenCV 3 QUIET)
    if(NOT OpenCV_FOUND)
        message(FATAL_ERROR "OpenCV 3.x not found.")
    endif()
endif()
find_package(Pangolin REQUIRED)
find_package(Ceres REQUIRED)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Charts)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Charts)



# can be deleted
find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)

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
        src/Initializer.cc)

# target link libraries
target_link_libraries(${PROJECT_NAME}
        ${EIGEN3_LIBS}
        ${OpenCV_LIBS}
        ${Pangolin_LIBRARIES}
        Qt5::Widgets
        Qt5::Core
        Qt5::Gui
        )

# Examples
add_executable(example_qt Examples/TestQt.cc
        src/mainwindow.cpp
        src/mainwindow.h
        src/mainwindow.ui)
target_link_libraries(example_qt PRIVATE
        Qt${QT_VERSION_MAJOR}::Widgets
        Qt${QT_VERSION_MAJOR}::Charts)
