# cmake_minimum_required(VERSION 3.24)
# 
# project("gcc-freestanding-playground")
# 
# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")
# 
# add_executable(${PROJECT_NAME}
#     "src/main.c"
# )
# 
# target_link_libraries(${PROJECT_NAME}
#     PRIVATE
#     -ffreestanding
#     -nostdlib
#     -nostartfiles
#     -nodefaultlibs 
# )
# 

cmake_minimum_required(VERSION 3.24)

project(gcc-freestanding-playground C)

# Add the executable
add_executable(${PROJECT_NAME}
    "src/main.c"
)

# Compile-time flags for freestanding
# -ffreestanding: define freestanding environment (no implicit standard library)
# -fno-builtin: optional, avoid compiler builtin functions that might rely on libc
target_compile_options(${PROJECT_NAME} PRIVATE
    -ffreestanding
    -fno-builtin
)

# Target both C and C++ standard include removals if necessary
target_compile_options(${PROJECT_NAME} PRIVATE 
    $<$<COMPILE_LANGUAGE:C>:-nostdinc>
    $<$<COMPILE_LANGUAGE:CXX>:-nostdinc++>
)

# Link-time flags: avoid the default C runtime and system libraries; link statically
# Use target_link_options (requires CMake >= 3.13; we require 3.24)
target_link_options(${PROJECT_NAME} PRIVATE
    -nostdlib
    -nostartfiles
    -nodefaultlibs
    -static
)



# Optional: pass a custom linker script via -DLINKER_SCRIPT=/path/to/script.ld
# CMake invocation example: cmake -DLINKER_SCRIPT=path/to/linker.ld ..
if(DEFINED LINKER_SCRIPT)
    message(STATUS "Using linker script: ${LINKER_SCRIPT}")
    target_link_options(${PROJECT_NAME} PRIVATE "-Wl,-T${LINKER_SCRIPT}")
endif()

# Optional: set a custom entry point symbol (e.g. _start)
# Usage: cmake -DENTRY_SYMBOL=_start ..
if(DEFINED ENTRY_SYMBOL)
    message(STATUS "Setting entry symbol: ${ENTRY_SYMBOL}")
    target_link_options(${PROJECT_NAME} PRIVATE "-Wl,-e,${ENTRY_SYMBOL}")
endif()

# Notes:
# - Provide your own startup (crt) or an _start symbol if you don't want the default
# - If cross-compiling, provide a toolchain file or set CMAKE_C_COMPILER/CMAKE_ASM_COMPILER
# - If you don't want any system headers included, consider -nostdinc or managing include paths
