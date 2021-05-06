#!/bin/perl

use open ':locale';
use locale;

if (@ARGV < 1) {
  die "Potrebno je predati prefiks.\n";
}

$prefix = pop @ARGV;

while (<>) {
  chomp;
  @words = split /[\s[:punct:]]+/, $_;

  foreach (@words) {
    next if length() < 4;
    $map{lc substr $_, 0, 4} += 1;   
  }
}

@sorted = sort keys %map;

foreach (@sorted) {
  printf "%s : %d\n", $_, $map{$_};
}
