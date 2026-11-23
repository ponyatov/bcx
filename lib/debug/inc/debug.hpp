/// @defgroup debug debug
/// @ingroup lib
/// @brief @ref compiler / @ref vm run traces & interactive debug (with IDE
/// integration)
/// @{
#pragma once

#include <stdarg.h>
#include <stdint.h>
#include <memory>
#include "vm.hpp"

enum class LogLevel : uint8_t { NONE, INFO, WARN, ERR, DEB };
extern LogLevel debug;  ///< global debug level flag

extern void log(const char *format, ...);    ///< unconditional logging
extern void info(const char *format, ...);   ///< log if @ref LogLevel::INFO +
extern void warn(const char *format, ...);   ///<
extern void err(const char *format, ...);    ///<
extern void trace(const char *format, ...);  ///< program run trace

#ifdef DAP

/// @defgroup dap DAP
/// @{

// #include <dap/io.h>
#include <dap/protocol.h>
#include <dap/session.h>

#include "dap/io.h"
#include "dap/network.h"

/// DAP server default IP port
#define DAP_PORT 4711

extern std::shared_ptr<dap::Session> session;  ///< DAP server

void dap_init();                 ///< init & run @ref session
int dap_wait();                  ///< DAP server command loop
extern dap::OutputEvent debcon;  ///< debug console

#endif  // DAP

/// @}

/// @}
