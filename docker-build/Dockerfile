FROM ubuntu:focal

RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list && \
    apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y devscripts git-buildpackage software-properties-common && \
    apt build-dep -y shim

# Clone shim, check out tag shim-15.2
RUN git clone --branch 15.2 https://github.com/rhboot/shim.git /shim-build
WORKDIR /shim-build

# Add our public certificate
ADD Cisco_Virtual_UEFI_SubCA_v3.der .

# Create build directories
RUN mkdir build-x64

# Build 64-bit
RUN make -C build-x64 ARCH=x86_64 EFI_PATH=/usr/lib VENDOR_CERT_FILE=../Cisco_Virtual_UEFI_SubCA_v3.der \
    TOPDIR=.. -f ../Makefile

# Copy the shim to a convenient location
RUN mkdir /shim-build/install
RUN cp build-x64/shimx64.efi /shim-build/install

