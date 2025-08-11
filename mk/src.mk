# .mk files
MK += Makefile
MK += $(wildcard   mk/*.mk)

# cmake files
CM += CMake* cmake/*.cmake

# C/C++
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)

# ini
S += $(wildcard lib/*.ini) $(wildcard lib/*.f)
