# HOME path
HOME=/home/pwnrazr

# Set compiler PATH
PATH=${HOME}/proton-clang/bin/:$PATH

make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu- armbian_defconfig
make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu- menuconfig
cp .config arch/arm64/configs/armbian_defconfig
make mrproper

