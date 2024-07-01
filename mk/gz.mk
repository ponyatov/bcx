
$(GZ)/$(GMP_GZ):
	$(CURL) $@ $(GMP_URL)/$(GMP_GZ)
$(GZ)/$(MPFR_GZ):
	$(CURL) $@ $(MPFR_URL)/$(MPFR_GZ)
$(GZ)/$(MPC_GZ):
	$(CURL) $@ $(MPC_URL)/$(MPC_GZ)
$(GZ)/$(ISL_GZ):
	$(CURL) $@ $(ISL_URL)/$(ISL_GZ)
$(GZ)/$(CLOOG_GZ):
	$(CURL) $@ $(CLOOG_URL)/$(CLOOG_GZ)

GZX += $(GZ)/$(GMP_GZ) $(GZ)/$(MPFR_GZ) $(GZ)/$(MPC_GZ)
GZX += $(GZ)/$(ISL_GZ) $(GZ)/$(CLOOG_GZ)

$(GZ)/$(BINUTILS_GZ):
	$(CURL) $@ $(BINUTILS_URL)/$(BINUTILS_GZ)
$(GZ)/$(GCC_GZ):
	$(CURL) $@ $(GCC_URL)/$(GCC_GZ)

GZX += $(GZ)/$(BINUTILS_GZ) $(GZ)/$(GCC_GZ)
