#!/bin/bash

### changes-final.txt
# Ordered from most recent (top) to older (bottom)
# Line format is `<ChangeType>  <FileName>`
# Git log shows A (added), M (modified) or D (deleted)
# Doing some bash operations gives us the most recent updated and removed files
###

CHANGES_FILE=changes.txt
CHANGES_FINAL_FILE=changes-final.txt

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
    else
        DELETED_FILES+=("$file_name")
    fi
done < $CHANGES_FINAL_FILE

# TODO:
# 1. Checkout from current repo
    #   uses: actions/checkout@v3

# 2:
# git config user.name "github-actions"
# git config user.email "actions@github.com"
# git remote add destination https://github.com/JSsixtyfour/smashremix.git

# 3. Push to destination repo
    #   - name: Push to Public Repository
    #     run: |
    #       git push destination main
    #     env:
    #       GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}    