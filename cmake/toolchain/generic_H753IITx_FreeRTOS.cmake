####
# nucleo_H723ZG_FreeRTOS.cmake:
# Alias for the current STM32H723ZG FreeRTOS toolchain configuration.
####

# include("${CMAKE_CURRENT_LIST_DIR}/stm32h7_FreeRTOS.cmake")

set(FPRIME_PLATFORM "stm32h7_FreeRTOS")
set(FPRIME_USE_BAREMETAL_SCHEDULER OFF)  
include(${CMAKE_CURRENT_LIST_DIR}/../../fprime-arduino/cmake/toolchain/generic_H753iiTx.cmake)

set(ARDUINO_BUILD_PROPERTIES
	"compiler.c.extra_flags=-DINCLUDE_xSemaphoreGetMutexHolder=1"
	"compiler.cpp.extra_flags=-DINCLUDE_xSemaphoreGetMutexHolder=1"
)

target_use_arduino_libraries("STM32FreeRTOS")