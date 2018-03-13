#!/bin/bash
set -x
cd /workspace/cisco_common_shim
id
make VENDOR_CERT_FILE=build-tools/certs/trca.der
mkdir -p install_path
export DATATARGETDIR=$PWD/install_path
make install-as-data


