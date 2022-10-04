cmake_minimum_required(VERSION 3.0.0)
project(OpenGLGameProject VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(OpenGLGame main.cpp)
add_subdirectory(include)
add_subdirectory(dependencies/glfw)
#add_subdirectory(dependencies/build/cmake) GLEW_USE_STATIC_LIBS=ON

target_include_directories(OpenGLGame
    PUBLIC dependencies/glew-2.2.0/ # where is include dir?
    PUBLIC dependencies/glfw/include
)

target_link_directories(OpenGLGame
    PUBLIC ${PROJECT_SOURCE_DIR}/dependencies/glew-2.2.0/lib/libGLEW.so.2.2.0 #smth like dependencies/glew-2.2.0/lib/libGLEW.so.2.2.0
    PUBLIC dependencies/glfw/src
)

target_link_libraries(OpenGLGame glfw glut GL GLU) # Add GLEW etc

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
