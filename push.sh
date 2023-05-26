#!/bin/sh

PWD=$(basename "$PWD")

if git ls-files --others --exclude-standard | grep -q .; then
    # If there are untracked files, use git add to add them to the index
    git add .
    echo "Untracked files added to git index."
fi

git commit -m 'push commit' -a

git pull

git push

cd ..


if [ -d "/Volumes/T7" ]; then
    rm -r /Volumes/T7/studium/praxissemester/ps_bericht
    rsync -av --exclude='.git*' "$PWD"/ps_bericht /Volumes/T7/studium/praxissemester
fi

rm -r ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Studium/Praxissemester/PS_Bericht/ps_bericht
rsync -av --exclude='.git*' "$PWD"/ps_bericht ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Studium/Praxissemester/PS_Bericht/

