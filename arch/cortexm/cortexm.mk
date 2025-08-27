OS     = none
TARGET = arm-none-eabi
EXE    = .elf

APT   += gcc-arm-none-eabi gdb-multiarch qemu-system-arm
APT   += sudo apt install -uy newlib-source stlink-tools dfu-util dos2unix
