# gcc tested versions
GCC_INFRA = http://gcc.gnu.org/pub/gcc/infrastructure

GMP       = gmp-$(GMP_VER)
GMP_GZ    = $(GMP).tar.bz2
# GMP_URL   = https://ftp.gnu.org/gnu/gmp
GMP_URL   = $(GCC_INFRA)

MPFR      = mpfr-$(MPFR_VER)
MPFR_GZ   = $(MPFR).tar.bz2
# MPFR_URL  = https://www.mpfr.org/mpfr-current
MPFR_URL  = $(GCC_INFRA)

MPC       = mpc-$(MPC_VER)
MPC_GZ    = $(MPC).tar.gz
# MPC_URL   = https://ftp.gnu.org/gnu/mpc/$(MPC)
MPC_URL   = $(GCC_INFRA)

ISL       = isl-$(ISL_VER)
ISL_GZ    = $(ISL).tar.bz2
ISL_URL	  = $(GCC_INFRA)

CLOOG     = cloog-$(CLOOG_VER)
CLOOG_GZ  = $(CLOOG).tar.gz
CLOOG_URL = $(GCC_INFRA)

BINUTILS     = binutils-$(BINUTILS_VER)
BINUTILS_GZ  = $(BINUTILS).tar.xz
BINUTILS_URL = http://ftp.gnu.org/gnu/binutils

GCC          = gcc-$(GCC_VER)
GCC_GZ       = $(GCC).tar.xz
GCC_URL      = https://mirror.koddos.net/gcc/releases/$(GCC)

LINUX     = linux-$(LINUX_VER)
LINUX_GZ  = $(LINUX).tar.xz
LINUX_URL = http://mirrors.edge.kernel.org/pub/linux/kernel/v6.x

LIBC     = uClibc-ng-$(LIBC_VER)
LIBC_GZ  = $(LIBC).tar.xz
LIBC_URL = https://downloads.uclibc-ng.org/releases/$(LIBC_VER)

BB     = busybox-$(BB_VER)
BB_GZ  = $(BB).tar.bz2
BB_URL = https://busybox.net/downloads

ZLIB     = zlib-$(ZLIB_VER)
ZLIB_GZ  = $(ZLIB).tar.gz
ZLIB_URL = https://www.zlib.net/fossils
