# generic cross-C++ project file tree

```sh
mkdir {.vscode,bin,doc,lib,inc,src,tmp,ref}
touch {.vscode,bin,doc,lib,inc,src,tmp,ref,.}/.gitignore
```
```sh
echo '*' > bin/.gitignore
echo '*' > tmp/.gitignore
echo '*' > ref/.gitignore
```
```sh
touch .vscode/extensions.json
touch .vscode/settings.json
touch .vscode/tasks.json
touch .vscode/launch.json
touch .vscode/c_cpp_properties.json
```

## Generic project

```
.vscode/        project-local config for VSCode IDE
bin/            target for for executable binaries/firmware images
doc/            Obsidian vault (Wiki-like docs)
    html/       Doxygen-generated project reference
lib/            portable libraries
    vm/         platform-independent VM parts
inc/
                project-specific headers
src/
                project-specific source code
tmp/
ref/
```

## cross-compiler subtree

```
hw/
    inc/
        hw.hpp
    pc/                 generic x86 PC
    rpi3/               Raspberry Pi 3
    dkc1                ESP32-S3-DevKitC-1
    pill030             STM32F030F4P6
    pill103             STM32F103C8T6
cpu/
    inc/
        cpu.hpp
    core2/              x86_64
    i686/               i386 universal 32 bit
    i486/               i386 for old hardware
    stm32f030Ff4p       @ pill030
    stm32f103c8t        @ pill103
    esp32s3             @ dkc1
arch/
    inc/
        arch.hpp
    x86_64/             modern x86
    i386/               PC104 & retro PC
    armv7/              32-bit Raspberry
    aarch64/
    esp32s/             Tensilika/Xtensa
    esp32c/             Risc-V
os/
    inc/
        os.hpp
    none/               bare-metal
    linux/              desktop/server/embedded Linux
    win/                Win7+ (MinGW)
    rtos/               FreeRTOS variants
lib/                    portable libraries
    main/               POSIX entry point
    vm/                 platform-independent VM parts
    bc/                 bytecode compiler
    cli/                command console
    gui/                portable GUI
```
