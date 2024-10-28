cmake_minimum_required(VERSION 3.29)
project(9)

set(CMAKE_CXX_STANDARD 20)

add_executable(9 main.cpp
)
include_directories(openssl)
link_directories(openssl)
include_directories(include)
link_directories(include)
