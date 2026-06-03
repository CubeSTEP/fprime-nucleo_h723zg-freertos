####
# stm32h7_FreeRTOS.cmake:
# Platform support for STM32H7 FreeRTOS Arduino integration.
####
if(NOT DEFINED ARDUINO_FQBN)
    message(FATAL_ERROR "Must defined arduino FQBN")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
    set(ARDUINO_TYPES_DIR "${FPRIME_PROJECT_ROOT}/lib/fprime-nucleo_h723zg-freertos/cmake/platform/arm/Platform") 
else()
    set(ARDUINO_TYPES_DIR "${FPRIME_PROJECT_ROOT}/lib/fprime-nucleo_h723zg-freertos/cmake/platform/basic/Platform")
endif()

set(CMAKE_EXECUTABLE_SUFFIX "${FPRIME_ARDUINO_EXECUTABLE_SUFFIX}" CACHE INTERNAL "" FORCE)

# This platform hook sets ArduinoFw so the common fprime-arduino utilities are
# selected after STM32H7-specific toolchain setup.
set(FPRIME_PLATFORM "ArduinoFw")

include_directories("${CMAKE_CURRENT_LIST_DIR}")
include_directories("${FPRIME_PROJECT_ROOT}/lib/fprime-nucleo_h723zg-freertos/fprime-arduino")
include_directories("${FPRIME_PROJECT_ROOT}/lib/fprime-nucleo_h723zg-freertos/fprime-freertos")
include_directories("${CMAKE_BINARY_DIR}/fprime-arduino")
add_fprime_subdirectory("${ARDUINO_TYPES_DIR}")
