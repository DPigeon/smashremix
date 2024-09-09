#!/bin/bash

### changes-final.txt
# Ordered from most recent (top) to older (bottom)
# Line format is `<ChangeType>  <FileName>`
# Git log shows A (added), M (modified), D (deleted) or R (replaced)
# Doing some bash operations gives us the most recent updated and removed files
#
# Usage: ./release/find-and-apply-changes.sh <PUBLIC_REPO_CLONE_DIR> <IGNORE|>
# e.g `./release/find-and-apply-changes.sh smashremix-public ".github/|test-dir"`
###

PUBLIC_REPO_PATH=$1
IGNORE=$2
CHANGES_FILE=changes.txt
CHANGES_FINAL_FILE=changes-final.txt

if [ -z "$PUBLIC_REPO_PATH" ] || [ ! -d "$PUBLIC_REPO_PATH" ]; then 
    echo "Wrong public repository path: $PUBLIC_REPO_PATH" 
    exit 1
fi

SINCE=$(curl -s https://api.github.com/repos/JSsixtyfour/smashremix/releases/latest \
        | grep '"published_at":' \
        | sed 's/.*"published_at": "\(.*\)",/\1/'
)
git log --since=$SINCE --name-status --oneline --diff-filter=ADMR --pretty=format: > $CHANGES_FILE
awk '!seen[$2]++' $CHANGES_FILE | xargs -0 printf "%b\n" | sed 's/"//g' > $CHANGES_FINAL_FILE # Removes duplicates, finds recent changes without sorting & removes octal sequence

while IFS=$'\t' read -r change_type file_name file_name_replaced; do
    if [[ ! $file_name =~ $IGNORE ]]; then
        if [[ $change_type =~ A|M ]]; then
            mkdir -p "$PUBLIC_REPO_PATH"/$(dirname "$file_name")
            cp -pr "$file_name" "$PUBLIC_REPO_PATH/$file_name"
        elif [[ $change_type == D ]]; then
            rm -rf "$PUBLIC_REPO_PATH/$file_name"
        elif [[ $change_type == R* ]]; then
            rm -rf "$PUBLIC_REPO_PATH/$file_name"
            mkdir -p "$PUBLIC_REPO_PATH"/$(dirname "$file_name_replaced")
            cp -pr "$file_name_replaced" "$PUBLIC_REPO_PATH/$file_name_replaced"
        else
            continue
        fi
    else
        continue
    fi
done < $CHANGES_FINAL_FILE

rm -rf $CHANGES_FILE $CHANGES_FINAL_FILE