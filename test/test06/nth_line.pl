#!/usr/bin/perl -w

open (FILE, '<', $ARGV[1]) or die;

$count = 1;
while ($line = <FILE>) {
    
    if ($count == $ARGV[0]) {
        print ("$line");
        last;
    }
    
    $count++;
}

close FILE;
