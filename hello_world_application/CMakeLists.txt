cmake_minimum_required(VERSION 3.4)
project(hello_world)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories("../formatter_ex_lib/")

add_executable(hello_world hello_world.cpp)

add_subdirectory("../formatter_ex_lib/" formatter_ex_lib)

target_link_libraries(hello_world formatter_ex_lib)
target_include_directories(hello_world PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
