#!/usr/bin/perl -w

use LWP::Simple;

$url = "http://www.timetable.unsw.edu.au/current/".$ARGV[0]."KENS.html";
$page = get($url) or die "Unable to get $url";

$data =~ ;
