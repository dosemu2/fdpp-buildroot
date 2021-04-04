BR2_EXTERNAL=`pwd`/br2
BR2_DEFCONFIG=$BR2_EXTERNAL/configs/fdpp_pc_x86_64_efi_defconfig
export DOSEMU2_SRCDIR=`pwd`/dosemu2
export FDPP_SRCDIR=`pwd`/fdpp
make -C buildroot BR2_EXTERNAL=$BR2_EXTERNAL BR2_DEFCONFIG=$BR2_DEFCONFIG $*
