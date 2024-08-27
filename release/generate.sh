#!/bin/bash

 # TODO: Get xdelta from https://github.com/jmacd/xdelta-gpl/releases/download/v3.1.0/xdelta3-3.1.0-i686.exe.zip

VERSION=$1
ROM_URL=$2

SR_NAME=smashremix
FILES_DIR=files
FILES_WITH_VERSION=( "README.txt" "LISEZ-MOI.txt" "LÉAME.txt" "README_日本語.txt" "pj64.rdb" "project64.rdb" )

EZPATCH_VERSION=1.0.1
EZPATCH_DIR=ezpatch
EZPATCH_FILE=easy-patch-template.zip
EZPATCH_CONTENT=( .ezpatch/ osx-drag-here.app/ output/ patches/ linux-drag-here.desktop windows-drag-here.bat )

echo "Setting version $VERSION in release files..."
sed -i "s/{VERSION}/$VERSION/g" $FILES_DIR/"Patch Notes.txt"
mv $FILES_DIR/"Patch Notes.txt" $FILES_DIR/"$VERSION Patch Notes.txt"
for f in "${FILES_WITH_VERSION[@]}"; do
    sed -i "s/{VERSION}/$VERSION/g" $FILES_DIR/$f
done

echo "Constructing body release..."
sed -i '1s/^/\n/' $FILES_DIR/"$VERSION Patch Notes.txt"
cat $FILES_DIR/"$VERSION Patch Notes".txt >> body.md

echo "Pulling xdelta files..."
mv ../xdelta.exe $FILES_DIR/ && mv ../xdeltaUI.exe $FILES_DIR/

echo "Generating Hex in RDB files..."
curl -sS -L "$ROM_URL" > r.zip
unzip -q *.zip 
rm -rf *.zip
NAME=$(find . -type f -name "*.z64")
../build_z64 -f "$NAME"
HEX=$(xxd -u -p -s 0x10 -l 8 -c 8 ../ssb64asm.z64 | sed -E 's/.{8}/&-/g; s/-$//')
sed -i "s/{HEX}/$HEX/g" $FILES_DIR/${FILES_WITH_VERSION[4]}
sed -i "s/{HEX}/$HEX/g" $FILES_DIR/${FILES_WITH_VERSION[5]}
rm -rf ../*.z64

echo "Building EzPatch..."
mkdir $EZPATCH_DIR
curl -sS -L https://github.com/CEnnis91/easy-patch/releases/download/v$EZPATCH_VERSION/$EZPATCH_FILE > $EZPATCH_DIR/$EZPATCH_FILE
cd $EZPATCH_DIR && unzip -q $EZPATCH_FILE 
for c in "${EZPATCH_CONTENT[@]}"; do
    mv $c ../$FILES_DIR/
done
cd ../
rm -rf $EZPATCH_DIR
mv ../original.xdelta $FILES_DIR/patches/${SR_NAME}${VERSION}.xdelta

echo "Preparing release file $SR_NAME$VERSION.zip..."
zip -q -r ${SR_NAME}${VERSION}.zip $FILES_DIR/
unzip -l ${SR_NAME}${VERSION}.zip # View content without extracting