$(GZ)/$(BINUTILS_GZ):
	$(CURL) $@ $(BINUTILS_URL)/$(BINUTILS_GZ)
$(GZ)/$(GCC_GZ):
	$(CURL) $@ $(GCC_URL)/$(GCC_GZ)

$(GZ)/$(GMP_GZ):
	$(CURL) $@ $(GMP_URL)/$(GMP_GZ)
$(GZ)/$(MPFR_GZ):
	$(CURL) $@ $(MPFR_URL)/$(MPFR_GZ)
$(GZ)/$(MPC_GZ):
	$(CURL) $@ $(MPC_URL)/$(MPC_GZ)
