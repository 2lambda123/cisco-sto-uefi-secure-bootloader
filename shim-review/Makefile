TAG=cisco-uefi-secure-bootloader

build:
	sudo docker build -t ${TAG} .

# Build without cache to make grabbing the full build log easier
build-no-cache:
	sudo docker build --no-cache -t ${TAG} .

# Run the container to copy the two shim builds to the host
copy:
	sudo docker run -v ${PWD}:/host:z ${TAG} cp -r /shim-build/install /host

# Print details of the public certificate
cert-info:
	openssl x509 -inform der -in Cisco_Virtual_UEFI_SubCA_v3.der -noout -text

# Dump ".sbat" section of the builds
dump-sbat:
	objdump -j .sbat -s install/*

.PHONY: build build-no-cache cert-info copy dump-sbat