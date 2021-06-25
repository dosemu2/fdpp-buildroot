qemu-system-x86_64 -hda buildroot/output/images/disk.img -enable-kvm \
    -cpu core2duo,vmx=on -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
    -device intel-hda -device hda-duplex -m 2G
