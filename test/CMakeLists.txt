# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(clang-on-windowsTests LANGUAGES CXX)

add_executable(clang-on-windows_test source/clang-on-windows_test.cpp)
target_link_libraries(clang-on-windows_test PRIVATE clang-on-windows_lib)
target_compile_features(clang-on-windows_test PRIVATE cxx_std_17)

add_test(NAME clang-on-windows_test COMMAND clang-on-windows_test)
