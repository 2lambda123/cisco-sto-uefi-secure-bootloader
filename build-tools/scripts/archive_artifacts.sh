#!/bin/bash

# Archive the shim efi binaries and generate a checksum

cd cisco_common_shim

# Determine the version 

export VERSION=`grep -P "VERSION\t" Makefile | awk -F = '{ print $2 } ' | tr -d ' '`

#Create tarball of released, signed product
#When signed image is received from MSFT, Create the tarball with the
#image and the matching sha256sum
#The tarball should be stored the $BUILDROOT/shim-review/artifact/releaseImages/
tar -czvf cisco_common_shim_v_$VERSION.tar.gz -C install_path/ .

#hash the tarball
openssl dgst -sha512 cisco_common_shim_v_$VERSION.tar.gz > cisco_common_shim_v_$VERSION.tar.gz.sha512


