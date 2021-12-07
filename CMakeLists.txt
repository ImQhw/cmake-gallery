cmake_minimum_required(VERSION 3.16)

project(cmake-gallery)

set(USR_CMAKE_DIR ${PROJECT_SOURCE_DIR}/cmake)

include (${USR_CMAKE_DIR}/asio.cmake)
include (${USR_CMAKE_DIR}/json.cmake)
include (${USR_CMAKE_DIR}/ur_rtde.cmake)

add_executable(a.out main.cpp)

target_link_libraries(a.out
    PRIVATE
        asio
        nlohmann_json::nlohmann_json
        ur_rtde::rtde
)