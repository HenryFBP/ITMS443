#!/usr/bin/perl
use strict;
use warnings;

require("./scripts.pm");
our(@TARGET, @OUTFOLDER);

system("ping -c 4 @TARGET | tee @OUTFOLDER/ping.txt");
