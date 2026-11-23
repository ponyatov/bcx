import json, socket, sys
s = socket.create_connection(("127.0.0.1", 4711))

initialize = {"type": "request", "command": "initialize",
              "arguments": {"adapterID": "bcx", # req
                            "clientID": "dap.py"}}
disconnect = {"type": "request", "command": "disconnect"}

seq = 0

def send(cmd):
    global seq
    seq += 1; cmd['seq'] = seq
    print(cmd)
    b = json.dumps(cmd).encode(); b
    s.sendall(b"Content-Length: %d\r\n\r\n" % len(b) + b)
    print(s.recv(4096).decode())

send(initialize)
send(disconnect)
