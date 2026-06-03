// ======================================================================
// 	itle  STM32H7FatalHandler.hpp
// \brief  Fatal handler for STM32H7 FreeRTOS deployments.
// ======================================================================

#ifndef STM32H7_FreeRTOS_FatalHandler_HPP
#define STM32H7_FreeRTOS_FatalHandler_HPP

#include "STM32H7FreeRTOS/Svc/STM32H7FatalHandler/STM32H7FatalHandlerComponentAc.hpp"

namespace STM32H7_FreeRTOS {

class STM32H7FatalHandler final : public STM32H7FatalHandlerComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct STM32H7FatalHandler object
    STM32H7FatalHandler(const char* const compName  //!< The component name
    );

    //! Destroy STM32H7FatalHandler object
    ~STM32H7FatalHandler();

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for FatalReceive
    //!
    //! FATAL event receive port
    void FatalReceive_handler(FwIndexType portNum,  //!< The port number
                              FwEventIdType Id      //!< The ID of the FATAL event
                              ) override;
};

}  // namespace STM32H7_FreeRTOS

#endif
