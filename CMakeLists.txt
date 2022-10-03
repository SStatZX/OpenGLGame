cmake_minimum_required(VERSION 3.0.0)
project(OpenGLGameProject VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(OpenGLGame main.cpp)
add_subdirectory(include)
add_subdirectory(dependencies/glew-2.2.0/include)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
