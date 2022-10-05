cmake_minimum_required(VERSION 3.0.0)
project(OpenGLGameProject VERSION 0.1.0)

include(CTest)
#include(SelectLibraryConfigurations)
#include(FindGLEW)
enable_testing()

add_executable(OpenGLGame main.cpp)
add_subdirectory(include)
add_subdirectory(dependencies/glfw)
add_subdirectory(dependencies/glew-cmake) 
set(glew-cmake_BUILD_SHARED "OFF") # This seems to not work, shared library still builds. Workaround is to link static library instead
set(ONLY_LIBS "ON")

#find_package(GLEW REQUIRED)

target_include_directories(OpenGLGame
    PUBLIC dependencies/glew-cmake/include
    PUBLIC dependencies/glfw/include
)

# target_link_directories(OpenGLGame # Apparently not needed? Runs without it
#     PUBLIC dependencies/glew-cmake/lib
#     PUBLIC dependencies/glfw/src
# )

target_link_libraries(OpenGLGame glfw glut GL GLU libglew_static) # libglew_static is workaround for now...

target_compile_definitions(OpenGLGame PRIVATE
#    -DGLEW_USE_STATIC_LIBS=ON
    -DGLFW_BUILD_DOCS=OFF # This doesn't work, needs fixing.
    -Dglew-cmake_BUILD_SHARED=OFF
    )

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)