## cross-C++ subtree

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
```sh
mkdir {hw,cpu,arch,os,lib}
touch {hw,cpu,arch,os,lib}/.gitignore
mkdir {hw,cpu,arch,os,lib}/{inc,src}
touch {hw,cpu,arch,os,lib}/{inc,src}/.gitignore
```
```sh
mkdir hw/inc
mkdir hw/pc
mkdir cpu/{core2,i686}
mkdir cpu/{core2,i686}/{inc,src}
touch cpu/{core2,i686}/{inc,src}/.gitignore
mkdir arch/{x86_64,i486}
mkdir arch/{x86_64,i486}/{inc,src}
touch arch/{x86_64,i486}/{inc,src}/.gitignore
mkdir os/{linux,win}
mkdir lib/{main,vm,bc,cli}
mkdir lib/{main,vm,bc,cli}/{inc,src}
touch lib/{main,vm,bc,cli}/{inc,src}/.gitignore
```
