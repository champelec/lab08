cmake_minimum_required(VERSION 3.4)

project(solver_application)

include_directories("../formatter_ex_lib/")
include_directories("../solver_lib/")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(solver_application equation.cpp)

add_subdirectory("../formatter_ex_lib/" formatter_ex_lib)
add_subdirectory("../solver_lib/" solver_lib)

target_link_libraries(solver_application PRIVATE formatter_ex_lib solver_lib)

target_include_directories(equation PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
