set(libname genicam)
set(genicam_DIR ${PROJECT_SOURCE_DIR}/3rdparty/vilab-camera) # set library directories here
set(genicam_BIN_DIR ${genicam_DIR}/x64/vc15)
set(genicam_INCLUDE_DIRS ${genicam_DIR}/include)
set(genicam_LIBS ${libname})

add_library(${libname} SHARED IMPORTED)
set_target_properties(${libname} PROPERTIES LINKER_LANGUAGE CXX)

set_target_properties(${libname} PROPERTIES 
    LINKER_LANGUAGE CXX 
    IMPORTED_LINK_INTERFACE_LANGUAGES CXX

    # include
    INTERFACE_INCLUDE_DIRECTORIES ${genicam_INCLUDE_DIRS}
    
    # debug
    IMPORTED_IMPLIB_DEBUG ${genicam_BIN_DIR}/debug/${libname}.lib
    IMPORTED_LOCATION_DEBUG ${genicam_BIN_DIR}/debug/${libname}.dll

    # release
    IMPORTED_IMPLIB_RELEASE ${genicam_BIN_DIR}/release/${libname}.lib
    IMPORTED_LOCATION_RELEASE ${genicam_BIN_DIR}/release/${libname}.dll

    # Use Release version of library for MinSizeRel and RelWithDebInfo build types
    MAP_IMPORTED_CONFIG_MINSIZEREL Release
    MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)

# opencv dependency
include (${PROJECT_SOURCE_DIR}/cmake/opencv.cmake)
target_include_directories(${libname} INTERFACE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${libname} INTERFACE ${OpenCV_LIBS})
