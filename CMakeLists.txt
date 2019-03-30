set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
cmake_minimum_required(VERSION 3.7)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g")
set(CMAKE_ASM_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -x assembler-with-cpp -Wa,-mimplicit-it=thumb -gdwarf-2")
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections,-Map=rt-thread.map,-cref,-u,Reset_Handler -T ${CMAKE_CURRENT_LIST_DIR}/board/linker_scripts/link.lds")

project(rt-thread C ASM)
set(CMAKE_C_STANDARD 11)

set(RTT_ROOT ${CMAKE_CURRENT_LIST_DIR}/../../../)

include_directories(
        .
        applications
        board
        board/CubeMX_Config/Inc

        ${RTT_ROOT}/include
        ${RTT_ROOT}/components/libc/compilers/minilibc
        ${RTT_ROOT}/components/finsh
        ${RTT_ROOT}/components/drivers/include
        ${RTT_ROOT}/components/drivers/wlan/

        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/CMSIS/Device/ST/STM32F4xx/Include
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/CMSIS/Include
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/Inc

        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/config
)
file(GLOB_RECURSE SOURCES
        applications/main.c
        board/board.c
        board/CubeMX_Config/Src/stm32f4xx_hal_msp.c

        ${RTT_ROOT}/components/finsh/*
        ${RTT_ROOT}/components/libc/compilers/minilibc/*
        ${RTT_ROOT}/components/drivers/src/*
        ${RTT_ROOT}/components/drivers/misc/pin.c
        ${RTT_ROOT}/components/drivers/serial/*
        ${RTT_ROOT}/components/drivers/wlan/*
        ${RTT_ROOT}/components/drivers/usb/usbhost/core/*

        ${RTT_ROOT}/libcpu/arm/common/backtrace.c
        ${RTT_ROOT}/libcpu/arm/common/div0.c
        ${RTT_ROOT}/libcpu/arm/common/showmem.c
        ${RTT_ROOT}/libcpu/arm/cortex-m4/context_gcc.S
        ${RTT_ROOT}/libcpu/arm/cortex-m4/cpuport.c

        ${RTT_ROOT}/src/*

        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_cec.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_cortex.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_crc.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_cryp.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_cryp_ex.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_dma.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_dma_ex.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_pwr.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_pwr_ex.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rcc.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rcc_ex.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_rng.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_gpio.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_uart.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_usart.c

        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_gpio.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_usart.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_common.c
        )
add_definitions(-DSTM32F407xx -DRT_USING_MINILIBC -DUSE_HAL_DRIVER)

add_executable(${PROJECT_NAME}.elf ${SOURCES})

add_custom_target(UPLOAD
        arm-none-eabi-gdb -iex "target remote tcp:127.0.0.1:3333"
        -iex "monitor program $<TARGET_FILE:${PROJECT_NAME}.elf>"
        -iex "monitor reset init"
        -iex "disconnect" -iex "quit")