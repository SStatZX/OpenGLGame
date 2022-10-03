cmake_minimum_required(VERSION 3.0.0)
project(TemplateProject VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(Template main.cpp)
add_subdirectory(include)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
