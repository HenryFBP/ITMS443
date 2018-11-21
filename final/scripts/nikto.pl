#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);


foreach my $site (@SITES) {
  execute("nikto -host $site -C all 2>&1 | tee @OUTFOLDER/nikto/$site.txt");
}
