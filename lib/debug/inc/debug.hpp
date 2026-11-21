/// @defgroup debug debug
/// @ingroup lib
/// @brief @ref compiler / @ref vm run traces & interactive debug (with IDE
/// integration)
/// @{
#pragma once

#include <stdint.h>

enum class LogLevel : uint8_t { NONE, INFO, WARN, ERR, DEB };
extern LogLevel debug;  ///< global debug level flag

extern void log(const char *format, ...);    ///< unconditional logging
extern void info(const char *format, ...);   ///< log if @ref LogLevel::INFO +
extern void warn(const char *format, ...);   ///<
extern void err(const char *format, ...);    ///<
extern void trace(const char *format, ...);  ///< program run trace

// #include <dap/io.h>
#include <dap/protocol.h>
#include <dap/session.h>

#include "dap/io.h"
#include "dap/network.h"

// extern std::unique_ptr<dap::Session> session;  ///< DAP session

/// DAP server default IP port
#define DAP_PORT 4711

void dap_init();  ///< init & run @ref session
int dap_wait();   ///< DAP server command loop

/// @}
