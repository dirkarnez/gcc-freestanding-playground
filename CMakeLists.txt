cmake_minimum_required(VERSION 3.24)

project("gcc-freestanding-playground")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME}
    "src/main.c"
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    -ffreestanding
    -nostdlib
    -nostartfiles
    -nodefaultlibs 
)
