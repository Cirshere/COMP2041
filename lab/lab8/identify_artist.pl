#!/usr/bin/perl -w

%lyrics = ();   
foreach $file (glob "lyrics/*.txt") {
    open FILE, "<", $file or die;
    chomp $file;
    $filename = substr($file, 7, -4);
    $filename =~ s/_/ /g;
       
    while ($line = <FILE>) {
        chomp $line;
        @words = split /[^a-zA-Z]/, $line;
        foreach $word (@words) {
            chomp $word;
            if ($word eq "") {
                next;
            }
            $lyrics{$filename}{$word}++;           
            $lyrics{$filename}{total}++;
        }
    }
    close FILE;      
}

#print($lyrics{$filename}{total});

foreach $song (@ARGV) {
    chomp $song;
    open FILE, "<", "$song";
    %song = ();
    
    while ($line = <FILE>) {
        chomp $line;
        @words = split /[^a-zA-Z]/, $line;
        foreach $word (@words) {
            chomp $word;
            if ($word eq '') {
                next;
            }
            $song{"$word"}++;
        }
    }
    
    %probability = ();
    
    @keys1 = sort(keys %lyrics);
    foreach $key1 (@keys1) {
        
        #print("$lyrics{$key1}{total}\n");
        
        @keys2 = keys %song;
        foreach $key2 (@keys2) {
            #print($key2);
            
            if (exists($lyric{$key1}{$key2}) eq 0) {
                next;
            }
            
            #print("$song{$key2}\n");
            $probability{$key1} += (log(($lyric{$key1}{$key2} + 1) / $lyric{$key1}{total}) * $song{$key2});
        
        }
        
        print($probability{$key1});
    }
    
    
    close FILE;
}
