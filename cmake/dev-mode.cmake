include(CTest)
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

add_custom_target(
    run-exe
    COMMAND clang-on-windows_clang-on-windows
    VERBATIM
)
add_dependencies(run-exe clang-on-windows_clang-on-windows)
