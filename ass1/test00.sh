#!/bin/dash

#Test for girt-init

if [ -d .girt ]
then
    rm -r .girt  
fi

# Should succeed
sh girt-init
# Should fail
sh girt-init

rm -r .girt

# Should succeed
sh girt-init

if [ -d .girt ]
then
    echo  "Test 0 successful"
fi

