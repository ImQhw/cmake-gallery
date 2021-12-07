cmake_minimum_required(VERSION 3.16)

project(cmake-gallery)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if(MSVC) # build shared dll on windows
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
    set(BUILD_SHARED_LIBS TRUE)
endif()

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

add_subdirectory(hello)
