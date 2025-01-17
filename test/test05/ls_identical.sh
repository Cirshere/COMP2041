#!/bin/dash

dir1="$1"
dir2="$2"

for file in $dir1/*
do

    filename=$(echo "$file" | cut -d'/' -f2)

    if [ ! -f "$dir2/$filename" ]
    then    
        continue
    fi
    
    if ! cmp "$file" "$dir2/$filename" > /dev/null 2>&1
    then
        continue
    fi
    
    echo "$filename"

done
