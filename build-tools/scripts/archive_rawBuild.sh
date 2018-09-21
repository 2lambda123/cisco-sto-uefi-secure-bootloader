#!/bin/bash

# Archive the shim efi binaries, generate a checksum, and generate a .cab file

cd cisco_common_shim

# Determine the version 
export JENKINS_VERSION=$(BUILD_NUMBER)

#Calculate checksum and store in the repo
sha256sum shimx64.efi > shim-review/artifacts/rawBuild/shimx64.efi.$(JENKINS_VERSION).sha256sum

#Copy the .efi to shim-review/artifacts/rawBuild
cp shimx64.efi shim-review/artifacts/rawBuild/shimx64.efi.$(JENKINS_BUILD)

#Create the .cab file
lcab -n  shimx64.efi shim-review/artifacts/rawBuild/shimx64.efi.$(JENKINS_BUILD).sha256sum shim-review/artifacts/cabFiles/shimx64.cab

