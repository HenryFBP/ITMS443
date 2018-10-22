#!/usr/bin/perl
use strict;
use warnings;

require("./scripts.pm");
our(@TARGET, @OUTFOLDER);

system("nmap -p- @TARGET | tee @OUTFOLDER/nmap.txt")

