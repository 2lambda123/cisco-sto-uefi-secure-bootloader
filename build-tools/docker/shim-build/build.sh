#!/bin/bash
set -x
cd /workspace/cisco_common_shim
id
# Dump out various versions
gcc -v
objcopy -V

make VENDOR_CERT_FILE=build-tools/certs/cisco_virtual_root.der
mkdir -p install_path

# Copy over the desired binaires and take the SHA512 hash
cp shimx64.efi install_path/.
cp mmx64.efi install_path/.
cp fbx64.efi install_path/.

# Output various hashes for integrity checking
openssl dgst -sha512 install_path/shimx64.efi
openssl dgst -sha512 install_path/mmx64.efi
openssl dgst -sha512 install_path/fbx64.efi

openssl dgst -sha256 install_path/shimx64.efi 
openssl dgst -sha256 install_path/mmx64.efi
openssl dgst -sha256 install_path/fbx64.efi

# Create SHA256 hash files

sha256sum install_path/shimx64.efi install_path/shimx64.efi.sha256
sha256sum install_path/mmx64.efi install_path/mmx64.efi.sha256
sha256sum install_path/fbx64.efi install_path/fbx64.efi.sha256


