// ======================================================================
// 	itle  STM32H7FatalHandler.cpp
// \brief  Fatal handler for STM32H7 FreeRTOS deployments.
// ======================================================================

#include <Fw/Logger/Logger.hpp>
#include "STM32H7FreeRTOS/Svc/STM32H7FatalHandler/STM32H7FatalHandler.hpp"

namespace STM32H7_FreeRTOS {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

STM32H7FatalHandler ::STM32H7FatalHandler(const char* const compName) : STM32H7FatalHandlerComponentBase(compName) {}

STM32H7FatalHandler ::~STM32H7FatalHandler() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void STM32H7FatalHandler ::FatalReceive_handler(FwIndexType portNum, FwEventIdType Id) {
    Fw::Logger::log("FATAL %" PRI_FwEventIdType " handled.\n", Id);
    while (true) {}  // Returning might be bad
}

}  // namespace STM32H7_FreeRTOS
