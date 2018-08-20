#!/bin/bash
set -x
cd /workspace/cisco_common_shim
id
make VENDOR_CERT_FILE=build-tools/certs/cisco_virtual_root.der
mkdir -p install_path
export DATATARGETDIR=$PWD/install_path
make install-as-data


