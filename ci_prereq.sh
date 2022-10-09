#!/bin/sh

sudo apt update -q

# Things we might need for the deployment
sudo apt install git zip

# Add build deps for fdpp here (uses host build tools, not target)
sudo apt install\
    make\
    bison\
    flex\
    sed\
    bash\
    clang\
    nasm\
    lld\
    binutils\
    coreutils\
    libstdc++-10-dev\
    libelf-dev\
    autoconf\
    git\
    diffutils\
    debhelper

# Add build deps for buildroot here
sudo apt install build-essential wget curl libelf-dev

./init.sh
