.PHONY: doxy
doxy: .doxygen
	rm -rf doc/html ; doxygen $< 1>/dev/null
