#include "debug.hpp"

LogLevel debug = LogLevel::DEB;

#include <stdarg.h>
#include <stdio.h>

__attribute__((weak)) void log(const char *format, ...) {
    if (debug >= LogLevel::NONE) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

__attribute__((weak)) void info(const char *format, ...) {
    if (debug >= LogLevel::INFO) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

__attribute__((weak)) void warn(const char *format, ...) {
    if (debug >= LogLevel::WARN) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

__attribute__((weak)) void error(const char *format, ...) {  //
    if (debug >= LogLevel::ERR) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

__attribute__((weak)) void trace(const char *format, ...) {  //
    if (debug >= LogLevel::DEB) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void dump() {
    for (addr a = 0; a < Cp; a++) {
        if (a % 0x10 == 0)
            fprintf(stderr, "\n%.4X: ", a);
        else if (a % 0x08 == 0)
            fprintf(stderr, "  ");
        fprintf(stderr, " %.2X", M[a]);
    }
    fprintf(stderr, "\n");
}
