make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- armbian_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
cp .config arch/arm64/configs/armbian_defconfig
make mrproper

