# fprime-nucleo_h723zg-freertos/library.cmake
# This is a meta-library used only to pull in submodules.
# No components or modules are defined here.

if (FPRIME_TOOLCHAIN_NAME STREQUAL "stm32h7_FreeRTOS"
    OR FPRIME_TOOLCHAIN_NAME STREQUAL "nucleo_H723ZG_FreeRTOS"
    OR FPRIME_PLATFORM STREQUAL "stm32h7_FreeRTOS"
    OR FPRIME_PLATFORM STREQUAL "ArduinoFw")

    # Set the path to the Arduino libraries directory
    set(ARDUINO_LIB_PATH "$ENV{HOME}/Arduino/libraries")

    # TODO: Future Enhancement: Determine the path location instead of hardcoding the path here, Can break in the future.  
    set(ARDUINO_STM32_LIB_PATH "$ENV{HOME}/.arduino15/packages/STMicroelectronics/hardware/stm32/2.12.0")

    # Include directories for Arduino libraries
    include_directories(
        ${ARDUINO_LIB_PATH}/Time
        ${ARDUINO_LIB_PATH}/STM32duino_FreeRTOS/src
        ${ARDUINO_STM32_LIB_PATH}/libraries/Wire/src
        ${ARDUINO_STM32_LIB_PATH}/libraries/SPI/src
    )

    # Pull in only the Arduino modules used by the STM32H7 FreeRTOS deployment.
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/config")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Os")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Drv/StreamDriver")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Drv/HardwareRateDriver")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Svc/Ports")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Svc/ArduinoTime")
    add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/fprime-arduino/Arduino/Svc/LifeLed")
    include("${CMAKE_CURRENT_LIST_DIR}/fprime-freertos/library.cmake")

    # NOTE: This corresponds to STM32FreeRTOS.h from the STM32duino_FreeRTOS library
    target_use_arduino_libraries("STM32FreeRTOS")
endif()
