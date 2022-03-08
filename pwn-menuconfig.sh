# HOME path
HOME=/home/pwnrazr

# Set compiler PATH
PATH=${HOME}/azure-clang/bin/:$PATH

make ARCH=arm64 \
	CC=clang \
	LD="ld.lld" \
	AR="llvm-ar" \
	NM="llvm-nm" \
	OBJCOPY="llvm-objcopy" \
	OBJDUMP="llvm-objdump" \
	STRIP="llvm-strip" \
	CROSS_COMPILE=aarch64-linux-gnu- \
	LLVM=1 \
	LLVM_IAS=1 \
	armbian_defconfig

make ARCH=arm64 \
	CC=clang \
	LD="ld.lld" \
	AR="llvm-ar" \
	NM="llvm-nm" \
	OBJCOPY="llvm-objcopy" \
	OBJDUMP="llvm-objdump" \
	STRIP="llvm-strip" \
	CROSS_COMPILE=aarch64-linux-gnu- \
        LLVM=1 \
        LLVM_IAS=1 \
	menuconfig

cp .config arch/arm64/configs/armbian_defconfig

make mrproper

