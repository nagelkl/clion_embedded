cmake_minimum_required(VERSION 3.8)

# provide the toolchain-File to CMAKE
set(CMAKE_TOOLCHAIN_FILE nucleo.cmake)

project(clion_embedded)
enable_language(C ASM)

# Set this to ON if you want to debug the Generation- Process
set(CMAKE_VERBOSE_MAKEFILE OFF)

set(CMAKE_C_STANDARD 99)

# The User Sources
file(GLOB_RECURSE USER_SOURCES "Src/*.c" )

# The startup code
set(STARTUP "startup_stm32l476xx.s")

# The HAL Sources
# Since we are building all Sources in the HAL- Subfolder there should be only sources for configured peripherals
# in this folder. IN CubeMX choose Project/Settings/Code Generator "Copy only the necessary library files"
file(GLOB_RECURSE HAL_SOURCES "Drivers/STM32L4xx_HAL_Driver/Src/*.c")

include_directories(Inc)
include_directories(Drivers/STM32L4xx_HAL_Driver/Inc)
include_directories(Drivers/CMSIS/Include)
include_directories(Drivers/CMSIS/Device/ST/STM32L4xx/Include)

add_executable(${PROJECT_NAME}.elf ${STARTUP} ${USER_SOURCES} ${HAL_SOURCES})


