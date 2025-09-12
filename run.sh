die() {
    echo "$1"
    exit 1
}

ARGS=`grep linux buildroot/output/images/efi-part/EFI/BOOT/grub.cfg | sed 's/^ //' | cut -d " " -f 3-`

qemu-system-x86_64 -hda buildroot/output/images/disk.img -enable-kvm \
    -cpu host,kvm=on,-avx,-avx2,-fma,+vme \
    -kernel buildroot/output/images/bzImage \
    -append "$ARGS" \
    -device intel-hda -device hda-duplex -usbdevice tablet -m 2G
