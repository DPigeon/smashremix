#!/bin/bash

### changes-final.txt
# Ordered from most recent (top) to older (bottom)
# Line format is `<ChangeType>  <FileName>`
# Git log shows A (added), M (modified) or D (deleted)
# Doing some bash operations gives us the most recent updated and removed files
###

PUBLIC_REPO_PATH=$1
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
git log --since=$SINCE --name-status --oneline --pretty=format: > $CHANGES_FILE
awk '!seen[$2]++' $CHANGES_FILE > $CHANGES_FINAL_FILE # Removes duplicates and finds recent changes without sorting

UPDATED_FILES=()
DELETED_FILES=()

while IFS=$'\t' read -r change_type file_name; do
    if [[ $change_type =~ A|M ]]; then
        UPDATED_FILES+=("$file_name")
    elif [[ $change_type == D ]]; then
        DELETED_FILES+=("$PUBLIC_REPO_PATH/$file_name")
    else
        continue
    fi
done < $CHANGES_FINAL_FILE

rm -rf $CHANGES_FILE $CHANGES_FINAL_FILE

echo "Updating `${UPDATED_FILES[@]}` in public repo..."

### DELETE AFTER TEST
cat '123' > test1.txt
cat '1234' > test2.txt
cp -pr test1.txt test2.txt $PUBLIC_REPO_PATH/
### DELETE AFTER TEST

#cp -pr ${UPDATED_FILES[@]} $PUBLIC_REPO_PATH/

echo "Removing `${DELETED_FILES[@]}` from public repo..."
#rm -rf ${DELETED_FILES[@]}