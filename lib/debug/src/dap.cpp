#include "debug.hpp"

#ifdef DAP

std::shared_ptr<dap::Session> session = dap::Session::create();
static auto server = dap::net::Server::create();

dap::OutputEvent debcon;
static char outbuf[1024];

void dap_init() {
    session->registerHandler([&](const dap::InitializeRequest & /* request */) {
        info("DAP: InitializeRequest\n");
        dap::InitializeResponse response;
        return response;
    });
    session->registerHandler([](const dap::LaunchRequest &) {
        info("DAP: LaunchRequest\n");
        session->send(dap::InitializedEvent{});
        dap::StoppedEvent stopped;
        // stopped.reason = "breakpoint";
        // stopped.threadId = 1;
        stopped.allThreadsStopped = true;
        session->send(stopped);
        return dap::LaunchResponse{};
    });

    session->registerHandler([](const dap::ThreadsRequest &) {
        dap::ThreadsResponse response;
        dap::Thread thread;
        thread.id = 0;
        thread.name = "idle";
        response.threads.push_back(thread);
        thread.id = 1;
        thread.name = "init";
        response.threads.push_back(thread);
        return response;
    });

    session->registerHandler([](const dap::StackTraceRequest &request) {
        dap::StackTraceResponse response;
        dap::StackFrame frame;
        switch (request.threadId) {
            case 1:
                frame.id = 1;
                frame.name = "main";
                frame.line = 3;
                frame.column = 1;
                dap::Source src;
                src.name = "ini";
                std::filesystem::path absPath =
                    std::filesystem::current_path() / "bcx/lib/bcx.ini";
                src.path = absPath.string();
                frame.source = src;
                response.stackFrames.push_back(frame);
        }
        return response;
    });

    session->registerHandler([](const dap::ScopesRequest &) {
        dap::ScopesResponse response;
        dap::Scope scope;
        scope.name = "VM";
        scope.variablesReference = 100;
        response.scopes.push_back(scope);
        return response;
    });

    session->registerHandler([](const dap::VariablesRequest &request) {
        dap::VariablesResponse response;
        char buf[0x10];
        dap::Variable var;
        switch (request.variablesReference) {
            case 'M':
                var.name = "Cp";
                var.type = "uint16";
                snprintf(buf, sizeof(buf), "0x%04X", Cp);
                var.value = buf;
                response.variables.push_back(var);
                var.name = "Ip";
                var.type = "uint16";
                snprintf(buf, sizeof(buf), "0x%04X", Ip);
                var.value = buf;
                response.variables.push_back(var);
                break;
            case 'R':
                var.name = "Rp";
                var.type = "uint8";
                snprintf(buf, sizeof(buf), "0x%02X", Rp);
                var.value = buf;
                var.variablesReference = 0;
                var.indexedVariables = 0;
                response.variables.push_back(var);
                break;
            case 'D':
                var.name = "Dp";
                var.type = "uint8";
                snprintf(buf, sizeof(buf), "0x%02X", Dp);
                var.value = buf;
                var.variablesReference = 0;
                var.indexedVariables = 0;
                response.variables.push_back(var);
                break;
            default:
                //
                var.name = "M[]";
                var.type = "uint8";
                snprintf(buf, sizeof(buf), "byte[0x%X]", Msz);
                var.value = buf;
                var.variablesReference = 'M';
                var.indexedVariables = Cp + 2;
                response.variables.push_back(var);
                //
                var.name = "R[]";
                var.type = "uint16";
                snprintf(buf, sizeof(buf), "addr[%d]", Rsz);
                var.value = buf;
                var.variablesReference = 'R';
                var.indexedVariables = Rp + 1;
                response.variables.push_back(var);
                //
                var.name = "D[]";
                var.type = "int32";
                snprintf(buf, sizeof(buf), "cell[%d]", Dsz);
                var.value = buf;
                var.variablesReference = 'D';
                var.indexedVariables = Dp + 1;
                response.variables.push_back(var);
        }
        return response;
    });

    // session->registerHandler([](const dap::SourceRequest &request) {
    //     dap::SourceResponse response;
    //     switch (request.sourceReference) {
    //         default:
    //             response.content = "main:\n";
    //     }
    //     return response;
    // });

    // session->registerHandler([](const dap::ConfigurationDoneRequest &) {
    //     info("DAP: ConfigurationDoneRequest\n");
    //     return dap::ConfigurationDoneResponse{};
    // });

    session->registerHandler([](const dap::DisconnectRequest &) {
        error("DAP: DisconnectRequest\n");
        halt();
        return dap::DisconnectResponse{};
    });

    bool started = server->start(
        DAP_PORT,
        [](const std::shared_ptr<dap::ReaderWriter> &socket) {
            session->bind(socket, socket);
            session->startProcessingMessages();
        },
        [](const char *err) {
            error("\n\nDAP error:%s\n\n", err);
            abort();
        });
    assert(started);
    fprintf(stderr, "DAP: localhost:%i\n", DAP_PORT);
}

int dap_wait() {
    while (true) std::this_thread::sleep_for(std::chrono::seconds(1));
    return 0;
}

void log(const char *format, ...) {
    if (debug >= LogLevel::NONE) {
        va_list args;
        va_start(args, format);
        debcon.category = "stdout";
        vsnprintf(outbuf, sizeof(outbuf), format, args);
        debcon.output = outbuf;
        session->send(debcon);
        fprintf(stderr, "%s", outbuf);
        va_end(args);
    }
}

void info(const char *format, ...) {
    if (debug >= LogLevel::INFO) {
        va_list args;
        va_start(args, format);
        debcon.category = "stdout";
        vsnprintf(outbuf, sizeof(outbuf), format, args);
        debcon.output = outbuf;
        session->send(debcon);
        fprintf(stderr, "%s", outbuf);
        va_end(args);
    }
}

void warn(const char *format, ...) {
    if (debug >= LogLevel::WARN) {
        va_list args;
        va_start(args, format);
        debcon.category = "stdout";
        vsnprintf(outbuf, sizeof(outbuf), format, args);
        debcon.output = outbuf;
        session->send(debcon);
        fprintf(stderr, "%s", outbuf);
        va_end(args);
    }
}

void error(const char *format, ...) {  //
    if (debug >= LogLevel::ERR) {
        va_list args;
        va_start(args, format);
        debcon.category = "stderr";
        vsnprintf(outbuf, sizeof(outbuf), format, args);
        debcon.output = outbuf;
        session->send(debcon);
        fprintf(stderr, "%s", outbuf);
        va_end(args);
    }
}

void trace(const char *format, ...) {  //
    if (debug >= LogLevel::DEB) {
        va_list args;
        va_start(args, format);
        debcon.category = "stderr";
        vsnprintf(outbuf, sizeof(outbuf), format, args);
        debcon.output = outbuf;
        session->send(debcon);
        fprintf(stderr, "%s", outbuf);
        va_end(args);
    }
}

#endif  // DAP
