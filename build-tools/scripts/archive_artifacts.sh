#!/bin/bash

# Archive the shim efi binaries and generate a checksum

cd install_path

tar -czvf cisco_common_shim_v_${1}.tar.gz -C install_path/ .

openssl dgst -sha512 cisco_common_shim_v_${1}.tar.gz > cisco_common_shim_v_${1}.tar.gz.sha512
