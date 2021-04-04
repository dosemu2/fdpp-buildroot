git submodule update --init
git clone --depth=1 git://git.buildroot.net/buildroot
./make.sh defconfig
./make.sh
