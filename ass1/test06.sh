#!/bin/dash

if [ -d .girt ]
then
    rm -r .girt  
fi

sh girt-init

echo 'line 1' > a
echo 'line 2' > b
echo 'line 3' > c

