# INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# specify the cross compiler
set (CMAKE_C_COMPILER arm-none-eabi-gcc)

SET(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/STM32L476RGTx_FLASH.ld)
SET(COMMON_FLAGS "-mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -g -fno-common -fmessage-length=0")
SET(CMAKE_C_FLAGS "${COMMON_FLAGS} -std=gnu99" CACHE STRINGS "" FORCE)
SET(CMAKE_ASM_FLAGS ${COMMON_FLAGS})
SET(CMAKE_EXE_LINKER_FLAGS "-Wl,-gc-sections -lc -lm -lnosys -T ${LINKER_SCRIPT}")