cmake_minimum_required(VERSION 3.24.2)
enable_language(C ASM)
project(wideboy)

add_compile_definitions(_LANGUAGE_C _MIPS_SZLONG=32 F3DEX_GBI)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc")

file(GLOB COMMON_FILES "common/include/**/*.h")
add_library(common INTERFACE ${COMMON_FILES})
target_include_directories(common INTERFACE common/include)

file(GLOB LIBULTRA_FILES "libultra/src/*.c" "libultra/src/*.s" "libultra/include/**/*.h")
add_library(libultra STATIC ${LIBULTRA_FILES})
target_include_directories(libultra INTERFACE libultra/include)
target_link_libraries(libultra common)

file(GLOB LIBNUSYS_FILES "libnusys/src/*.c" "libnusys/include/*.h")
add_library(libnusys STATIC ${LIBNUSYS_FILES})
target_include_directories(libnusys INTERFACE libnusys/include)
target_link_libraries(libnusys common libultra)

file(GLOB LIBKMC_FILES "libkmc/src/*.c" "libkmc/src/*.s" "libkmc/include/*.h")
add_library(libkmc STATIC ${LIBKMC_FILES})
target_include_directories(libkmc INTERFACE libkmc/include)
target_link_libraries(libkmc common)

file(GLOB LIBNUSTD_FILES "libnustd/src/*.c" "libnustd/src/*.s" "libnustd/include/*.h")
add_library(libnustd STATIC ${LIBNUSTD_FILES})
target_include_directories(libnustd INTERFACE libnustd/include)
target_link_libraries(libnustd common)

file(GLOB MAIN_FILES "main/src/*.c" "main/include/*.h")
add_executable(wideboy ${MAIN_FILES})
target_include_directories(wideboy PRIVATE main/include)
target_link_libraries(wideboy libnusys libultra libnustd libkmc)
