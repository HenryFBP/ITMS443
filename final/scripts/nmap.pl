#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);


foreach my $site (@SITES) {
	execute("nmap -A -v --version-all -sC -p- -O $site 2>&1 | tee @OUTFOLDER/nmap/$site.txt");
}
