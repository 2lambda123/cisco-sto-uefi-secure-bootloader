To create a request for review:

- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Cisco Systems

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
Cisco Appliances and Virtual products that are using Linux based Opererating Systems

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Customers using Cisco Virtual products that run on 3rd party servers (DELL, HP...) do not have permissions to
change the UEFI db and add our keys.  The Microsoft signed SHIM allows these products to securely run on those
platforms

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Dan Osman
- Position: Senior Software Engineer
- Email address: dosman@cisco.com

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Peter Panburana
- Position: Software Engineer
- Email address: pepanbur@cisco.com

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/14

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/cisco/sto-uefi-secure-bootloader

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
none

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
Tools versions are listed in the build.log.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
https://github.com/cisco/sto-uefi-secure-bootloader/blob/cisco-shim-x64-20180802/shim-review/build.log

-------------------------------------------------------------------------------
Put info about what bootloader you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
GRUB2 shipping with CentOS 7, and Ubuntu

-------------------------------------------------------------------------------
Put info about what kernel you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
Standard kernels from CentOS 7 and Ubuntu. Secure boot support flags enabled during builds

