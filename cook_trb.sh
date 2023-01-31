#!/bin/bash
cd $(dirname $0)
export PATH="$HOME/toolchain/trb-clang/bin:$PATH"
# export LD_LIBRARY_PATH="$HOME/toolchain/trb-clang/lib"
export KBUILD_BUILD_USER=alfael
export KBUILD_BUILD_HOST=LI-DEV
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_CFLAGS="-Wno-maybe-uninitialized -Wno-memset-elt-size -Wno-duplicate-decl-specifier"
DEFCONFIG_FILE=alfkern_defconfig
if [ ! -d "./output/" ]; then
        mkdir ./output/
fi
#rm -r ./output/*
make CC=clang O=output clean
make CC=clang O=output mrproper
make CC=clang O=output $DEFCONFIG_FILE
make CC=clang O=output LD=ld.lld CC=clang AS=llvm-as AR=llvm-ar NM=llvm-nm OBJSIZE=llvm-size READELF=llvm-readelf OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM=1 LLVM_IAS=1 -j$(nproc) 2>&1 | tee build.log

#Generation package anykernel
PATH_OUTPUT=output/arch/arm64/boot
PATH_KERN=$PATH_OUTPUT/Image.gz-dtb
PATH_QCOM=$PATH_OUTPUT/dts/qcom/
PATH_PACKAGE=package
PATH_OUTPUT_PACKAGE=~/kernel/output

if [ ! -f "$PATH_KERN" ]; then
        echo Erreur de compilation avortement...
        exit;
fi
echo Compilation terminée !
echo Création du package flashable...
while read line
do
        if grep -q "SUBLEVEL = " <<< "$line"; then
                SUBLEVEL=$(cut -d "=" -f2 <<< "$line" | xargs)
                continue;
        fi
        if [ ! -z "$SUBLEVEL" ]; then
                break;
        fi
done < Makefile
while read line
do
        if grep -q "LOCALVERSION=" <<< "$line"; then
                LOCALVERSION=$(cut -d "-" -f2 <<< "$line" | xargs -0 | tr -d '"')
                continue;
        fi
        if [ ! -z "$LOCALVERSION" ]; then
                break;
        fi
done < arch/arm64/configs/$DEFCONFIG_FILE

/bin/cp -rf $PATH_KERN $PATH_PACKAGE
cd $PATH_PACKAGE
if [ -f $PATH_OUTPUT_PACKAGE/$LOCALVERSION.$SUBLEVEL.trb.zip ]; then
  rm $PATH_OUTPUT_PACKAGE/$LOCALVERSION.$SUBLEVEL.trb.zip
fi
zip -9 -r $PATH_OUTPUT_PACKAGE/$LOCALVERSION.$SUBLEVEL.trb.zip ./*
cd -;
echo Création du package: $LOCALVERSION.$SUBLEVEL.trb.zip terminée !
