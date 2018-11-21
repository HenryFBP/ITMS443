#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);

execute("hydra -e ns -u -L username_simple.lst -P /usr/share/john/password.lst -vV @TARGET ftp 2>&1 | tee @OUTFOLDER/hydra/ftp_bruteforce_wordlists_@TARGET.txt");
