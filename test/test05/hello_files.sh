#!/bin/dash

int="$1"
name="$2"

count=1

while [ "$count" -le "$int" ]
do
    echo "hello $name" > "hello$count.txt" 
    count=$((count + 1))
done
