#!/bin/dash

for dir in */
do

    count=0
    for file in $dir*
    do
    
        count=$((count + 1))
    
    done
    
    if [ $count -ge "2" ]
    then
        echo $dir | sed "s/\///g"
    fi

done