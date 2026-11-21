#include "debug.hpp"

LogLevel debug = LogLevel::DEB;

#include <stdarg.h>
#include <stdio.h>

static volatile bool console = true;
static auto session = dap::Session::create();
static auto server = dap::net::Server::create();

static dap::OutputEvent debcon;
static char outbuf[1024];

void log(const char *format, ...) {  //
    if (debug >= LogLevel::NONE) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
    }
}

void info(const char *format, ...) {
    if (debug >= LogLevel::INFO) {
        va_list args;
        va_start(args, format);
        if (console)
            vfprintf(stderr, format, args);
        else {
            debcon.category = "stdout";
            vsnprintf(outbuf, sizeof(outbuf), format, args);
            debcon.output = outbuf;
            session->send(debcon);
        }
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

void error(const char *format, ...) {  //
    if (debug >= LogLevel::ERR) {
        va_list args;
        va_start(args, format);
        if (console)
            vfprintf(stderr, format, args);
        else {
            debcon.category = "stderr";
            vsnprintf(outbuf, sizeof(outbuf), format, args);
            debcon.output = outbuf;
            session->send(debcon);
        }
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

#include "command.hpp"

void dap_init() {
    session->registerHandler([&](const dap::InitializeRequest & /* request */) {
        info("DAP: InitializeRequest\n");
        dap::InitializeResponse response;
        return response;
    });

    session->registerHandler([](const dap::LaunchRequest &) {
        error("DAP: LaunchRequest\n");
        session->send(dap::InitializedEvent{});
        return dap::LaunchResponse{};
    });

    session->registerHandler([](const dap::ConfigurationDoneRequest &) {
        info("DAP: ConfigurationDoneRequest\n");
        return dap::ConfigurationDoneResponse{};
    });

    session->registerHandler([](const dap::DisconnectRequest &) {
        info("DAP: DisconnectRequest\n");
        halt();
        return dap::DisconnectResponse{};
    });

    bool started = server->start(
        DAP_PORT,
        [](const std::shared_ptr<dap::ReaderWriter> &socket) {
            session->bind(socket, socket);
            session->startProcessingMessages();
            console = false;
        },
        [](const char *err) {
            error("\n\nDAP error:%s\n\n", err);
            abort();
        });
    assert(started);
    fprintf(stderr, "DAP: localhost:%i\n", DAP_PORT);
}

#include <thread>

int dap_wait() {
    while (true) std::this_thread::sleep_for(std::chrono::seconds(1));
    return 0;
}
