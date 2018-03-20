cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(cuda_test LANGUAGES CXX CUDA)

include(CTest)

if(BUILD_TESTING)

  add_executable(first_main first_main.cu)

  set_target_properties(first_main PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

  add_executable(go_main go_main.cu)

  set_target_properties(go_main PROPERTIES CUDA_SEPARABLE_COMPILATION ON)


endif()
