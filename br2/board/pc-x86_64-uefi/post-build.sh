#!/bin/sh

set -e

BOARD_DIR=$(dirname "$0")

cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"

rm -rf "$BINARIES_DIR/user-part"
mkdir -p "$BINARIES_DIR/user-part"
[ -f /tmp/ndn_3_00_0005_d32.zip ] || \
  (cd /tmp && curl -O http://www.ndn.muxe.com/download/file/ndn_3_00_0005_d32.zip)
unzip -q /tmp/ndn_3_00_0005_d32.zip -d "$BINARIES_DIR/user-part"
mv "$BINARIES_DIR/user-part/ndn_3_00_0005_d32" "$BINARIES_DIR/user-part/ndn"
cp -f "$BOARD_DIR/userhook.bat" "$BINARIES_DIR/user-part"
chmod a+rwX -R "$BINARIES_DIR/user-part"

rm -f "$BINARIES_DIR/user-part.ext4"
$HOST_DIR/bin/genext2fs -U -D "$BOARD_DIR/device_table.txt" -d "$BINARIES_DIR/user-part" -b 16000 "$BINARIES_DIR/user-part.ext4"
e2fsck "$BINARIES_DIR/user-part.ext4"
UUID=$(dumpe2fs "$BINARIES_DIR/user-part.ext4" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
grep -v UUID "$TARGET_DIR/etc/fstab" >"$TARGET_DIR/etc/fstab_"
echo "UUID=\"$UUID\" /mnt/drive_c ext4 rw,nodev,nosuid,noexec,noatime 0 0" >>"$TARGET_DIR/etc/fstab_"
mv "$TARGET_DIR/etc/fstab_" "$TARGET_DIR/etc/fstab"
[ -d "$TARGET_DIR/mnt/drive_c" ] || mkdir "$TARGET_DIR/mnt/drive_c"

[ -d "$TARGET_DIR/etc/sudoers.d" ] || mkdir "$TARGET_DIR/etc/sudoers.d"
cp -f "$BOARD_DIR/sudoers.d"/* "$TARGET_DIR/etc/sudoers.d/"
cp -f "$BOARD_DIR/profile.d"/* "$TARGET_DIR/etc/profile.d/"
cp -f "$BOARD_DIR/init.d"/* "$TARGET_DIR/etc/init.d/"

if grep "/sbin/getty" "$TARGET_DIR/etc/inittab" ; then
  grep -v getty "$TARGET_DIR/etc/inittab" >"$TARGET_DIR/etc/inittab_"
  echo "tty1::respawn:/bin/su - dosemu2" >>"$TARGET_DIR/etc/inittab_"
  mv "$TARGET_DIR/etc/inittab_" "$TARGET_DIR/etc/inittab"
fi
