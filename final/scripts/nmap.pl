#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);


foreach my $site (@SITES) {
	system("nmap -p- $site 2>&1 | tee @OUTFOLDER/nmap/$site");
}
