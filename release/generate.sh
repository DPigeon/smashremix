#!/bin/bash

 # TODO: Get xdelta from https://github.com/jmacd/xdelta-gpl/releases/download/v3.1.0/xdelta3-3.1.0-i686.exe.zip

VERSION=$1

SR_NAME=smashremix
FILES_DIR=files
README_FILES=( "README" "LISEZ-MOI" "LÉAME" "README_日本語" )

EZPATCH_VERSION=1.0.1
EZPATCH_DIR=ezpatch
EZPATCH_FILE=easy-patch-template.zip
EZPATCH_CONTENT=( .ezpatch/ osx-drag-here.app/ output/ patches/ linux-drag-here.desktop windows-drag-here.bat )

sed -i "s/{VERSION}/$VERSION/g" $FILES_DIR/"Patch Notes.txt"
mv $FILES_DIR/"Patch Notes.txt" $FILES_DIR/"$VERSION Patch Notes.txt"
for f in "${README_FILES[@]}"; do
    sed -i "s/{VERSION}/$VERSION/g" $FILES_DIR/$f
done

mv ../xdelta.exe $FILES_DIR/ && mv ../xdeltaUI.exe $FILES_DIR/

mkdir $EZPATCH_DIR
curl -sS -L https://github.com/CEnnis91/easy-patch/releases/download/v$EZPATCH_VERSION/$EZPATCH_FILE > $EZPATCH_DIR/$EZPATCH_FILE
cd $EZPATCH_DIR && unzip $EZPATCH_FILE 
for c in "${EZPATCH_CONTENT[@]}"; do
    mv $c ../$FILES_DIR/
done
cd ../
mv ../original.xdelta $FILES_DIR/patches/${SR_NAME}${VERSION}.xdelta
cd ../

zip -r ${SR_NAME}${VERSION}.zip $FILES_DIR/

ls -lh

rm -rf $EZPATCH_DIR