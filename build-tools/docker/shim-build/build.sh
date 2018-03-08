#!/bin/bash
set -x
cd /workspace/shim
VERSION=`grep -P "VERSION\t" Makefile | awk -F = '{ print $2 } ' | tr -d ' '`
id
make VENDOR_CERT_FILE=build-tools/certs/trca.der
mkdir -p install_path
export DATATARGETDIR=$PWD/install_path
make install-as-data


