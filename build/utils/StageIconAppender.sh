#!/bin/bash

JAR_DIR="$(dirname "$(readlink -f "$0")")"
STAGE_ICON=0A04
OUTPUT_FILE=$STAGE_ICON-new.bin

for icon_path in "$@"; do
    java -jar "$JAR_DIR/SSB64ImageFileAppender.jar" "$STAGE_ICON" "$icon_path"
    if [ -f "$OUTPUT_FILE" ]; then
        mv "$OUTPUT_FILE" "$STAGE_ICON.bin"
    else
        echo "$OUTPUT_FILE not found!"
    fi
done
read