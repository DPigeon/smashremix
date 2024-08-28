#!/bin/bash

 # TODO: Get xdelta from https://github.com/jmacd/xdelta-gpl/releases/download/v3.1.0/xdelta3-3.1.0-i686.exe.zip

VERSION=$1
HEX_CRC=$2

SR_NAME=smashremix
FILES_DIR=files
FILES_WITH_VERSION=( "README.txt" "LISEZ-MOI.txt" "LÉAME.txt" "README_日本語.txt" "pj64.rdb" "project64.rdb" )

EZPATCH_VERSION=1.0.1
EZPATCH_DIR=ezpatch
EZPATCH_FILE=easy-patch-template.zip
EZPATCH_CONTENT=( .ezpatch/ osx-drag-here.app/ output/ patches/ linux-drag-here.desktop windows-drag-here.bat )

SEMVER_REGEX="^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-(0|[1-9A-Za-z-][0-9A-Za-z-]*)(\.[0-9A-Za-z-]+)*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$"
HEX_REGEX="^[0-9A-F]{8}-[0-9A-F]{8}$"

exit_on_error () {
    echo "$1"
    exit 1
}

if [[ ! $VERSION =~ $SEMVER_REGEX ]]; then
    exit_on_error "Version must follow semantic versioning. Version provided: $VERSION"
fi
if [[ ! $HEX_CRC =~ $HEX_REGEX ]]; then
    exit_on_error "Wrong CRC. It must be an uppercase hexadecimal value in plain hexdump style. Hex provided: $HEX_CRC"
fi

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
for i in {4..5}; do
    sed -i "s/{HEX}/$HEX_CRC/g" $FILES_DIR/${FILES_WITH_VERSION[$i]}
done

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
mv $FILES_DIR/ ${SR_NAME}${VERSION}/
zip -q -r ${SR_NAME}${VERSION}.zip ${SR_NAME}${VERSION}/
unzip -l ${SR_NAME}${VERSION}.zip # View content without extracting