#!/bin/sh

set -e

UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
sed -i "s/UUID_TMP/$UUID/g" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
UUID2=$(dumpe2fs "$BINARIES_DIR/user-part.ext4" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
sed -e "s/UUID_TMP/$UUID/g" -e "s/UUID2_TMP/$UUID2/g" "$BR2_EXTERNAL_FDPP_PATH/board/pc-x86_64-uefi/genimage-efi.cfg" > "$BINARIES_DIR/genimage-efi.cfg"
support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-efi.cfg"
