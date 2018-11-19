#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);


system("which dirsearch.py");

if (not ($? == 0)) { #If the error code of the last command was NOT ZERO,
  printf("Download dirsearch.py and put it on your system PATH.\n");
  printf("If you think this is error, comment out this if statement.\n");
  exit($?)
}

foreach my $site (@SITES) {
  system("dirsearch.py"
  ." --url $site"
  ." --extensions txt,csv,xlsx,json,doc,pdf,docx,db,bin,php,asp,aspx,ascx,vbhtml,vba,cs,cshtml,py,htm,html,xhtml"
  ." --plain-text-report=@OUTFOLDER/dirsearch/$site.txt");
}
