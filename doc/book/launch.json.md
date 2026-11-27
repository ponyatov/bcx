# `launch.json`

```json
{
    "version": "0.2.0",
    "configurations": [
```
```json
        {
            "type": "bcx",
            "request": "launch",
            "name": "bcx: linux host",
            "program": "${workspaceFolder}/bin/${workspaceFolderBasename}"
        },
```
```json
        {
            "type": "cppdbg",
            "request": "launch",
            "name": "bcx: runtime (C++)",
            "program": "${workspaceFolder}/bin/${workspaceFolderBasename}",
            "args": [],
            "stopAtEntry": true,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
```
```json
    ]
}
```
