# `tasks.json`

```json
{
    "version": "2.0.0",
    "tasks": [
```
```json
        {
            "label"          : "project: install",
            "type"           : "shell",
            "command"        : "make install",
            "presentation"   : {"focus": true},
            "problemMatcher" : []
        },
```
```json
        {
            "label"          : "project: update",
            "type"           : "shell",
            "command"        : "make update",
            "presentation"   : {"focus": true},
            "problemMatcher" : []
        },
```
```json
        {
            "label"          : "doxy: gen",
            "type"           : "shell",
            "group"          : {"kind": "build", "isDefault": true },
            // "dependsOn"      : "CMake: build",
            "command"        : "make doxy",
            "problemMatcher" : [],
            "presentation"   : {"showReuseMessage": false, "focus": false, "reveal": "silent", "close": false}
        },
```
```json
        {
            "label"          : "make: book",
            "type"           : "shell",
            "command"        : "make book",
            "problemMatcher" : [],
            "presentation"   : {"showReuseMessage": true, "focus": true, "reveal": "silent", "close": false},
            "group"          : {"kind": "build", "isDefault": true}
        },
```
```json
        {
            "label"          : "make: ai",
            "type"           : "shell",
            "command"        : "make ai",
            "problemMatcher" : [],
            "presentation"   : {"showReuseMessage": true, "focus": true, "reveal": "silent", "close": false},
            "group"          : {"kind": "build", "isDefault": true}
        }
    ]
}
```
