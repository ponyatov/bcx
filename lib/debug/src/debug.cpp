#include "debug.hpp"

LogLevel debug = LogLevel::DEB;

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

static auto session = dap::Session::create();
static auto server = dap::net::Server::create();

void dap_init() {
    bool started = server->start(
        DAP_PORT,
        [](const std::shared_ptr<dap::ReaderWriter> &socket) {
            session->bind(socket, socket);
            session->startProcessingMessages();
        },
        [](const char *err) {
            fprintf(stderr, "\n\nDAP server error: %s\n\n", err);
            abort();
        });
    assert(started);
}
