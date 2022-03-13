#!/bin/bash
OUT_DIR=out/

# HOME path
HOME=/home/pwnrazr

# Set compiler PATH
PATH=${HOME}/azure-clang/bin/:$PATH

export KBUILD_BUILD_HOST=PWN-PC

START=$(date +"%s")

make ARCH=arm64 \
     CC="ccache clang" \
     CROSS_COMPILE="aarch64-linux-gnu-" \
     LD="ld.lld" \
     AR="llvm-ar" \
     NM="llvm-nm" \
     OBJCOPY="llvm-objcopy" \
     OBJDUMP="llvm-objdump" \
     STRIP="llvm-strip" \
     LLVM=1 \
     LLVM_IAS=1 \
     O=${OUT_DIR} \
     armbian_defconfig \
     -j$(nproc)

make ARCH=arm64 \
     CC="ccache clang" \
     CROSS_COMPILE="aarch64-linux-gnu-" \
     LD="ld.lld" \
     AR="llvm-ar" \
     NM="llvm-nm" \
     OBJCOPY="llvm-objcopy" \
     OBJDUMP="llvm-objdump" \
     STRIP="llvm-strip" \
     LLVM=1 \
     LLVM_IAS=1 \
     O=${OUT_DIR} \
     Image modules dtbs \
     -j$(nproc)

make ARCH=arm64 \
     CC="ccache clang" \
     CROSS_COMPILE="aarch64-linux-gnu-" \
     LD="ld.lld" \
     AR="llvm-ar" \
     NM="llvm-nm" \
     OBJCOPY="llvm-objcopy" \
     OBJDUMP="llvm-objdump" \
     STRIP="llvm-strip" \
     LLVM=1 \
     LLVM_IAS=1 \
     O=${OUT_DIR} \
     bindeb-pkg \
     -j$(nproc)

END=$(date +"%s")
DIFF=$(( END - START))
echo -e '\033[01;32m' "Kernel compiled successfully in $((DIFF / 60)) minute(s) and $((DIFF % 60)) seconds"
