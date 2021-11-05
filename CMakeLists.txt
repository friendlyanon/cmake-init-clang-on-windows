cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    clang-on-windows
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    clang-on-windows_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    clang-on-windows_lib ${clang-on-windows_warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(clang-on-windows_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(clang-on-windows_clang-on-windows source/main.cpp)
add_executable(clang-on-windows::clang-on-windows ALIAS clang-on-windows_clang-on-windows)

set_target_properties(
    clang-on-windows_clang-on-windows PROPERTIES
    OUTPUT_NAME clang-on-windows
    EXPORT_NAME clang-on-windows
)

target_compile_features(clang-on-windows_clang-on-windows PRIVATE cxx_std_17)

target_link_libraries(clang-on-windows_clang-on-windows PRIVATE clang-on-windows_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT clang-on-windows_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of clang-on-windows"
  )
endif()

include(cmake/dev-mode.cmake)
