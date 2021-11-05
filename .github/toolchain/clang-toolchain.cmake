set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# Tell Clang the triplet to target
set(CMAKE_C_COMPILER_TARGET x86_64-pc-windows)
set(CMAKE_CXX_COMPILER_TARGET x86_64-pc-windows)

# https://github.com/actions/virtual-environments/blob/main/images/win/Windows2019-Readme.md#workloads-components-and-extensions
set(windows_kit_version 10.0.21381.0)

# https://github.com/actions/virtual-environments/blob/main/images/win/Windows2019-Readme.md#microsoft-visual-c
set(msvc_version 14.29.30135)

# Clang needs to use MSVC link.exe and needs the system .lib files
set(CMAKE_EXE_LINKER_FLAGS_INIT "\
-Xlinker /libpath:\"C:\\Program Files (x86)\\Windows Kits\\10\\Lib\\${windows_kit_version}\\um\\x64\" \
-Xlinker /libpath:\"C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\VC\\Tools\\MSVC\\${msvc_version}\\lib\\x64\"\
")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT}")

# Standard headers
include_directories(
    SYSTEM
    "C:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/VC/Tools/MSVC/${msvc_version}/include"
    "C:/Program Files (x86)/Windows Kits/10/include/${windows_kit_version}/ucrt"
    "C:/Program Files (x86)/Windows Kits/10/include/${windows_kit_version}/um"
    "C:/Program Files (x86)/Windows Kits/10/include/${windows_kit_version}/shared"
)

# This is a guess. Need to look deeper into why Windows.h business gets
# involved with standard headers.
add_compile_definitions(WIN32_MEAN_AND_LEAN NOMINMAX)
