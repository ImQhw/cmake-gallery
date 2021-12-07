include(FetchContent)

FetchContent_Declare(
    ur_rtde 
    GIT_REPOSITORY https://gitlab.com/sdurobotics/ur_rtde.git
    GIT_TAG v1.4.5
)

FetchContent_MakeAvailable(ur_rtde)
