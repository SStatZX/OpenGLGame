cmake_minimum_required(VERSION 3.0.0)
project(OpenGLGameProject VERSION 0.1.0)

include(CTest)
include(FindGLEW)
enable_testing()

add_executable(OpenGLGame main.cpp)
add_subdirectory(include)

find_package(GLEW REQUIRED)


target_link_libraries(OpenGLGame glfw glut GL GLU GLEW) # libglew_static is workaround for now...

target_compile_definitions(OpenGLGame PRIVATE
    -DGLFW_BUILD_DOCS=OFF # This doesn't work, needs fixing.
    -Dglew_cmake_BUILD_SHARED=OFF
    )

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)