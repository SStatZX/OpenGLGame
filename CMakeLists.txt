cmake_minimum_required(VERSION 3.0.0)
project(OpenGLGameProject VERSION 0.1.0)

include(CTest)
include(FindGLEW)
enable_testing()

add_executable(OpenGLGame main.cpp)
add_subdirectory(include)
add_subdirectory(dependencies/glfw)
#add_subdirectory(dependencies/glew/build/cmake) #GLEW_USE_STATIC_LIBS=ON
Find_GLEW(GLEW_USE_STATIC_LIBS=ON)

target_include_directories(OpenGLGame
    #PUBLIC dependencies/glew/ # where is include dir?
    PUBLIC ${GLEW_INCLUDE_DIRS}
    PUBLIC dependencies/glfw/include
)

target_link_directories(OpenGLGame
    #PUBLIC dependencies/glew/lib/libGLEW.so.2.2.0 #smth like dependencies/glew-2.2.0/lib/libGLEW.so.2.2.0
    PUBLIC ${GLEW_STATIC_LIBRARIES}
    PUBLIC dependencies/glfw/src
)

target_link_libraries(OpenGLGame glfw glut GL GLU GLEW) # Add GLEW etc

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
