if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/clang-on-windows CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package clang-on-windows)

install(
    TARGETS clang-on-windows_clang-on-windows
    EXPORT clang-on-windowsTargets
    RUNTIME COMPONENT clang-on-windows_Runtime
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    clang-on-windows_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(clang-on-windows_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${clang-on-windows_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT clang-on-windows_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${clang-on-windows_INSTALL_CMAKEDIR}"
    COMPONENT clang-on-windows_Development
)

install(
    EXPORT clang-on-windowsTargets
    NAMESPACE clang-on-windows::
    DESTINATION "${clang-on-windows_INSTALL_CMAKEDIR}"
    COMPONENT clang-on-windows_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
