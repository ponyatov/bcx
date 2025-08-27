NEWLIB       = newlib-$(NEWLIB_VER)
NEWLIB_GZ    = $(NEWLIB).tar.xz

YANDEX_MIRROR = https://mirror.yandex.ru/mirrors/gnu

GMP          = gmp-$(GMP_VER)
GMP_GZ       = $(GMP).tar.xz
GMP_URL      = $(YANDEX_MIRROR)/gmp

MPFR         = mpfr-$(MPFR_VER)
MPFR_GZ      = $(MPFR).tar.xz
MPFR_URL     = $(YANDEX_MIRROR)/mpfr

MPC          = mpc-$(MPC_VER)
MPC_GZ       = $(MPC).tar.gz
MPC_URL      = $(YANDEX_MIRROR)/mpc

BINUTILS     = binutils-$(BINUTILS_VER)
BINUTILS_GZ  = $(BINUTILS).tar.xz
BINUTILS_URL = $(YANDEX_MIRROR)/binutils

GCC          = gcc-$(GCC_VER)
GCC_GZ       = $(GCC).tar.xz
GCC_URL      = $(YANDEX_MIRROR)/gcc/$(GCC)

GDB          = gdb-$(GDB_VER)
GDB_GZ       = $(GDB).tar.xz
GDB_URL      = $(YANDEX_MIRROR)/gdb
