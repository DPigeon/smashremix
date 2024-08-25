#!/bin/bash

JAR_DIR="$(dirname "$(readlink -f "$0")")"
CHARACTER_ICON=0A05
OUTPUT_FILE=$CHARACTER_ICON-new.bin

for icon_path in "$@"; do
    java -jar "$JAR_DIR/SSB64ImageFileAppender.jar" "$CHARACTER_ICON" "$icon_path"
    if [ -f "$OUTPUT_FILE" ]; then
        mv "$OUTPUT_FILE" "$CHARACTER_ICON.bin"
    else
        echo "$OUTPUT_FILE not found!"
    fi
done
read