#include "debug.hpp"

LogLevel debug = LogLevel::DEB;

// dap::Session session = dap::Session::create();

#include <stdarg.h>
#include <stdio.h>

void log(const char *format, ...) {  //
    if (debug >= LogLevel::NONE) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void info(const char *format, ...) {  //
    if (debug >= LogLevel::INFO) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void warn(const char *format, ...) {  //
    if (debug >= LogLevel::WARN) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void err(const char *format, ...) {  //
    if (debug >= LogLevel::ERR) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void trace(const char *format, ...) {  //
    if (debug >= LogLevel::DEB) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}
