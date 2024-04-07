set(CMAKE_SYSTEM_NAME "Darwin")
set(CMAKE_SYSTEM_PROCESSOR "x86_64")

set(CMAKE_SYSROOT $ENV{CROSS_SYS})

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Everything is statically linked, so no need
set(CMAKE_PLATFORM_HAS_INSTALLNAME OFF)
