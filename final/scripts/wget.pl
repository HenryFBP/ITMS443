#!/usr/bin/perl
use strict;
use warnings;

require("./shared.pm");
our(@TARGET, @OUTFOLDER, @SITES);

# Download site contents.
foreach my $site (@SITES) {
	system("wget -r --no-clobber --directory-prefix=@OUTFOLDER/wget --no-parent $site");
}

# Find form elements.
system("egrep '(<form)|(<input)' -r '@OUTFOLDER/wget' 2>&1 | tee @OUTFOLDER/wget/forms_and_inputs.txt")
