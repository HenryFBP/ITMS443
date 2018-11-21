use strict;
use warnings;

our @OUTFOLDER="out";
our @TARGET="172.43.35.10"; # Hello there, random GitHub user. This is an internal IP. Just letting you know.

our @SITE1="www.goodshopping.com"; # And these are also internal.
our @SITE2="www.moviescope.com";

our @SITES=(@SITE1, @SITE2);

sub execute() {
  my $cmd = shift();
  printf("$cmd\n");
  system($cmd);
}
