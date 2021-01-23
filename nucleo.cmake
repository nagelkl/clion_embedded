# Toolchain- File for the STM32L4 Controller
#
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

# Suppress Error when trying to test the compiler
SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# specify the cross compiler
set (CMAKE_C_COMPILER arm-none-eabi-gcc)
set (CMAKE_CXX_COMPILER arm-none-eabi-g++)

# The settings in this file are based on the Makefile that CubeMX automatically generates

#optimization
set (OPT "-Og")

# cpu
set(CPU "-mcpu=cortex-m4")

# fpu
set(FPU "-mfpu=fpv4-sp-d16")

# float-abi
set(FLOAT_ABI "-mfloat-abi=hard")

# mcu
set(MCU "${CPU} -mthumb ${FPU} ${FLOAT_ABI}")

# C defines
set(C_DEFS " -DUSE_HAL_DRIVER -DSTM32L476xx")

# AS defines
set(AS_DEFS "")

SET(CMAKE_C_FLAGS "${MCU} ${C_DEFS} ${OPT} -Wall -fdata-sections -ffunction-sections")

SET(ASFLAGS "${MCU} ${AS_DEFS} ${OPT} -Wall -fdata-sections -ffunction-sections")

SET(CMAKE_ASM_FLAGS ${ASFLAGS})

# link script
SET(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/STM32L476RGTx_FLASH.ld)

# libraries
set(LIBS "-lc -lm -lnosys")
set (LIBDIR "")

set (LDFLAGS "-specs=nano.specs -T${LINKER_SCRIPT} ${LIBDIR} ${LIBS} -Wl,-Map=info.map,--cref -Wl,--gc-sections")

set(CMAKE_EXE_LINKER_FLAGS  "${LDFLAGS}")

