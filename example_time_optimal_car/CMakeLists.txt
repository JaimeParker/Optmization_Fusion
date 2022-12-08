cmake_minimum_required(VERSION 3.24)
project(example_time_optimal_car)

set(CMAKE_CXX_STANDARD 17)

# include header file
include_directories(
        ${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/include)

# include source file
add_library(${PROJECT_NAME} SHARED
        src/Model.cc)

# target link libraries
target_link_libraries(${PROJECT_NAME} )

# Examples
add_executable(test Examples/test.cc)
