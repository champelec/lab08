cmake_minimum_required(VERSION 3.4)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(PRINT_VERSION_MAJOR 1)
set(PRINT_VERSION_MINOR 0)
set(PRINT_VERSION_PATCH 1)
set(PRINT_VERSION_TWEAK 0)
set(PRINT_VERSION ${PRINT_VERSION_MAJOR}.${PRINT_VERSION_MINOR}.${PRINT_VERSION_PATCH}.${PRINT_VERSION_TWEAK})
set(PRINT_VERSION_STRING "v${PRINT_VERSION}")

project(lab06)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib formatter_ex_new_name)

target_include_directories(formatter_ex_lib PUBLIC formatter_ex_lib formatter_lib hello_world_application solver_lib)

add_library(solver_lib ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib/solver.cpp)

add_executable(lab06 ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)

target_link_libraries(lab06 formatter_lib formatter_ex_lib solver_lib)

install(TARGETS lab06
RUNTIME DESTINATION bin
)

include(CPackConfig.cmake)
