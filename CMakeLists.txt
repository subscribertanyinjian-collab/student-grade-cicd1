cmake_minimum_required(VERSION 3.10)
project(StudentGradeSystem)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

# 1. Production Application Executable
add_executable(GradeSystem
src/main.cpp
src/GradeCalculator.cpp

)

# 2. Automated Testing &amp; Coverage Configuration
enable_testing()
find_package(GTest REQUIRED)

add_executable(GradeSystemTests
tests/GradeCalculatorTest.cpp
src/GradeCalculator.cpp
)

target_compile_options(GradeSystemTests PRIVATE --coverage)
target_link_options(GradeSystemTests PRIVATE --coverage)
target_link_libraries(GradeSystemTests PRIVATE GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(GradeSystemTests)
