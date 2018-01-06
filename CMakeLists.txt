cmake_minimum_required(VERSION 3.8)
project(clion_embedded)
enable_language(C ASM)

set(CMAKE_VERBOSE_MAKEFILE OFF)
add_definitions(-DSTM32L476xx)
add_definitions(-DUSE_HAL_DRIVER)
set(CMAKE_C_STANDARD 99)
set(CMAKE_TOOLCHAIN_FILE nucleo.cmake)

# The User Sources
file(GLOB_RECURSE USER_SOURCES "Src/*.c" )

# The HAL Sources
# Since we are building all Sources in the HAL- Subfolder there should be only sources for configured peripherals
# in this folder. IN CubeMX choose Project/Settings/Code Generator "Copy only the necessary library files"
file(GLOB_RECURSE HAL_SOURCES "Drivers/STM32L4xx_HAL_Driver/Src/*.c")

# todo At the moment I don't know why we need this library step and cannot put these files the normal source variables
 add_library(CMSIS
        Src/system_stm32l4xx.c
        startup_stm32l476xx.s)

include_directories(Inc)
include_directories(Drivers/STM32L4xx_HAL_Driver/Inc)
include_directories(Drivers/CMSIS/Include)
include_directories(Drivers/CMSIS/Device/ST/STM32L4xx/Include)

# todo why do we need the linker script as an source file to the add_executeable function?
add_executable(FirstSTM32L4.elf ${USER_SOURCES} ${HAL_SOURCES} ${LINKER_SCRIPT})

target_link_libraries(FirstSTM32L4.elf CMSIS)


