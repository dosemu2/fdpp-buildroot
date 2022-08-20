die() {
    echo "$1"
    exit 1
}

OVMF=/usr/share/edk2/ovmf/OVMF_CODE.fd
[ -r "$OVMF" ] || OVMF=/usr/share/OVMF/OVMF_CODE.fd
[ -r "$OVMF" ] || die "ovmf not found"

qemu-system-x86_64 -hda buildroot/output/images/disk.img -enable-kvm \
    -cpu host -bios "$OVMF" \
    -device intel-hda -device hda-duplex -usbdevice tablet -m 2G
