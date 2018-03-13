#!/bin/bash

# Archive the shim efi binaries and generate a checksum

cd cisco_common_shim

# Determine the version 

export VERSION=`grep -P "VERSION\t" Makefile | awk -F = '{ print $2 } ' | tr -d ' '`

tar -czvf cisco_common_shim_v_$VERSION.tar.gz -C install_path/ .

openssl dgst -sha512 cisco_common_shim_v_$VERSION.tar.gz > cisco_common_shim_v_$VERSION.tar.gz.sha512



