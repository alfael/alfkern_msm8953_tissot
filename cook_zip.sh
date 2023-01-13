#!/bin/bash
cd $(dirname $0)
DEFCONFIG_FILE=alfkern_defconfig
if [ ! -d "./output/" ]; then
	echo Erreur rien a zipper
	exit;
fi
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
