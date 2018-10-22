#!/usr/bin/perl
use strict;
use warnings;

require("./scripts.pm");
our(@TARGET, @OUTFILE);

system("nmap -p- @TARGET | tee @OUTFILE")

