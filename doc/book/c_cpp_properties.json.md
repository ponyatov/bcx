# `c_cpp_properties.json`
## настройки C/C++ проекта

Файл не влияет на сборку — сборкой управляет CMake. Его единственная задача — сообщить IntelliSense (`ms-vscode.cpptools`), где искать заголовки, чтобы работали навигация и автодополнение в редакторе кода.

```json
{
    "version": 4,
    "env": {
        "appInclude": [
            "${workspaceFolder}/inc/**",
            "${workspaceFolder}/tmp/**",
            "${workspaceFolder}/src/**"
        ],
        "libInclude": [
            "${workspaceFolder}/lib/inc/**",
            "${workspaceFolder}/lib/*/inc/**"
        ],
        "crossInclude": [
            "${workspaceFolder}/hw/inc/**"  ,"${workspaceFolder}/hw/*/inc/**"  ,
            "${workspaceFolder}/cpu/inc/**" ,"${workspaceFolder}/cpu/*/inc/**" ,
            "${workspaceFolder}/arch/inc/**","${workspaceFolder}/arch/*/inc/**",
            "${workspaceFolder}/os/inc/**"  ,"${workspaceFolder}/os/*/inc/**"
        ]
    },
    "configurations": [
        {
            "name"                 : "cmake",
            "configurationProvider": "ms-vscode.cmake-tools",
            "mergeConfigurations"  :  true,
            "includePath"          : ["${appInclude}", "${libInclude}", "${crossInclude}"]
        }
    ]
}
```

Раскладка репозитория [[bcx]] разделяет **код конкретного приложения**, **разделяемый** и **кросс-платформенный** код:

- `appInclude`:
	- код специфичный для приложения
- `libInclude`:
	- библиотеки разработчика, разделяемые между множеством проектов
- `crossInclude`:
	- код специфичный для конкретных целевых платформ:
		- процессор, архитектура
		- операционная система, среда выполнения

Связка с CMake:

- `configurationProvider`
	- флаги компилятора, дефайны и пути к файлам берутся из CMake
- `mergeConfigurations`
	- `includePath` из раздела `env` **дополняют** конфигурацию от основного провайдера
