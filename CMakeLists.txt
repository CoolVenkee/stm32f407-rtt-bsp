set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
cmake_minimum_required(VERSION 3.7)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(OBJCOPY arm-none-eabi-objcopy)
set(OBJDUMP arm-none-eabi-objdump)
set(SIZE arm-none-eabi-size)
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
        ${RTT_ROOT}/components/libc/compilers/common
        ${RTT_ROOT}/components/libc/compilers/newlib
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
        # kernel
        ${RTT_ROOT}/src/*

        # components
        ${RTT_ROOT}/components/finsh/*
        ${RTT_ROOT}/components/libc/compilers/common/gmtime_r.c
        ${RTT_ROOT}/components/libc/compilers/newlib/libc.c
        ${RTT_ROOT}/components/libc/compilers/newlib/libc_syms.c
        ${RTT_ROOT}/components/libc/compilers/newlib/stdio.c
        ${RTT_ROOT}/components/libc/compilers/newlib/syscalls.c
        ${RTT_ROOT}/components/libc/compilers/newlib/time.c

        # arch
        ${RTT_ROOT}/libcpu/arm/common/backtrace.c
        ${RTT_ROOT}/libcpu/arm/common/div0.c
        ${RTT_ROOT}/libcpu/arm/common/showmem.c
        ${RTT_ROOT}/libcpu/arm/cortex-m4/context_gcc.S
        ${RTT_ROOT}/libcpu/arm/cortex-m4/cpuport.c

        # HAL
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
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_iwdg.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_wwdg.c
        ${RTT_ROOT}/bsp/stm32/libraries/STM32F4xx_HAL/STM32F4xx_HAL_Driver/src/stm32f4xx_hal_eth.c

        # drivers
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_gpio.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_usart.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_common.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_wdt.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_eth.c
        ${RTT_ROOT}/bsp/stm32/libraries/HAL_Drivers/drv_soft_i2c.c
        ${RTT_ROOT}/components/drivers/src/*
        ${RTT_ROOT}/components/drivers/misc/pin.c
        ${RTT_ROOT}/components/drivers/serial/*
        ${RTT_ROOT}/components/drivers/wlan/*
        ${RTT_ROOT}/components/drivers/usb/usbhost/core/*
        ${RTT_ROOT}/components/drivers/watchdog/watchdog.c
        ${RTT_ROOT}/components/drivers/i2c/i2c_core.c
        ${RTT_ROOT}/components/drivers/i2c/i2c_dev.c
        ${RTT_ROOT}/components/drivers/i2c/i2c-bit-ops.c

        # board specific
        board/board.c
        board/ports/phy_reset.c
        board/CubeMX_Config/Src/stm32f4xx_hal_msp.c

        # app
        applications/main.c
        applications/test_wdt.c
        applications/test_button.c
        applications/test_at_client.c
        )

include(network.cmake)
include(pkg.cmake)

# minilibc
#add_definitions(-DHAVE_CCONFIG_H -DSTM32F407xx -DRT_USING_MINILIBC -DUSE_HAL_DRIVER)
# newlib
add_definitions(-DHAVE_CCONFIG_H -DSTM32F407xx -DRT_USING_NEWLIB -DUSE_HAL_DRIVER)

add_executable(${PROJECT_NAME}.elf ${SOURCES} ${LWIP_SOURCES} ${PKG_SOURCES})

set(HEX_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
set(BIN_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.bin)
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_FILE}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_FILE}
        COMMENT
        "Building ${HEX_FILE}\nBuilding ${BIN_FILE}")

add_custom_target(UPLOAD
        arm-none-eabi-gdb -iex "target remote tcp:127.0.0.1:3333"
        -iex "monitor program $<TARGET_FILE:${PROJECT_NAME}.elf>"
        -iex "monitor reset init"
        -iex "disconnect" -iex "quit")