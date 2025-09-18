#pragma once

#ifndef F429DISCO
#error F429DISCO
#endif  // F429DISCO

#include "stm32f4xx_hal.h"
#include "usart.h"

extern void UART_log(const char *);
extern void UART_hex(int);
