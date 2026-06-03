module STM32H7_FreeRTOS {
    @ FatalHandler specific for fprime-nucleo_h723zg-freertos
    passive component STM32H7FatalHandler {

        @ FATAL event receive port
        sync input port FatalReceive: Svc.FatalEvent

    }
}
