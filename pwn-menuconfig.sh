make ARCH=arm64 armbian_defconfig
make ARCH=arm64 menuconfig
cp .config arch/arm64/configs/armbian_defconfig
make mrproper

