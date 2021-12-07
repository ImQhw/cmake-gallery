find_package(OpenCV QUIET)

if(NOT ${OpenCV_FOUND})
    set(OpenCV_DIR C:/libraries/opencv-4.2.0/x64/vc15/lib)
    message("find opencv in debug dir ${OpenCV_DIR}")
    find_package(OpenCV REQUIRED)
endif()

# collect opencv dll paths
set(OpenCV_DLL_PATHS "")
foreach(ocv_lib ${OpenCV_LIBS})
    get_target_property(ocv_dll_location ${ocv_lib} LOCATION)

    list(APPEND OpenCV_DLL_PATHS ${ocv_dll_location})
endforeach(ocv_lib ${OpenCV_LIBS})

# remove dumplicates
list(REMOVE_DUPLICATES OpenCV_DLL_PATHS)

message(STATUS "OpenCV_DLL_PATHS ${OpenCV_DLL_PATHS}")
