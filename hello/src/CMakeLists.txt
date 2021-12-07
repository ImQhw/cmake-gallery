add_library(hello SHARED)

target_sources(hello
    INTERFACE
        ${PROJECT_SOURCE_DIR}/include/hello/hello.hpp

    PRIVATE
        hello.cpp
)

target_include_directories(hello
    PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)
