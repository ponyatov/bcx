# `bcx` 0.0.1
## ByteCode eXecutor
> script language VM for embedded systems

(c) Dmitry Ponyatov <<dponyatov@gmail.com>> 2026 MIT

## Targets

- desktop
  - generic Linux (Debian GNU/Linux 12+) server/desktop /x86/
  - Windows i686 32bit (Win7+/WINE32)
- embedded Linux
  - ARCH
    - `i386` (retro PC, PC104)
    - `x86_64`
    - `armv7` (RPi3-)
    - `aarch64` (RPi3+)
  - build system
    - `Buildroot`
    - cross-LFS like (total handmade with `uClibc`, `busybox` & minimal libs set)
- MCU
  - Cortex-M (STM32F)
    - pill boards
    - DISCOVERY series
  - ESP32
    - ESP32S
    - ESP32C
  - AVR/Mega (Arduino)
- mobile
  - Android
