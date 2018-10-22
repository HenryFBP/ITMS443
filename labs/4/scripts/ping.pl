#!/usr/bin/perl
use strict;
use warnings;

require("./scripts.pm");
our(@TARGET, @OUTFILE);

system("ping -c 4 @TARGET | tee @OUTFILE");
