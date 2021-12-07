if(MSVC) # build on windows

set(BOOST_ROOT C:/Users/qin_hw/Downloads/boost_1_77_0)
set(BOOST_LIBRARYDIR C:/Users/qin_hw/Downloads/boost_1_77_0/libs)
set(Boost_USE_STATIC_LIBS ON)

endif()

set(PYTHON_BINDINGS OFF CACHE INTERNAL "Turn off Python binding")

include(FetchContent)
FetchContent_Declare(
    ur_rtde 
    GIT_REPOSITORY https://gitlab.com/sdurobotics/ur_rtde.git
    GIT_TAG v1.4.5
)

FetchContent_MakeAvailable(ur_rtde)
