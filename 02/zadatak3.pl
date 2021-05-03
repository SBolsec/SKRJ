#!/bin/perl

$ispisan_header = 0;

while(defined($redak = <>)) {
  chomp($redak);

  @args = split /\./, $ARGV;
  $_ = "@args[$#args - 1]";
  ($datum) = /([\d]{4}-[\d]{2}-[\d]{2})/;

  if (! $ispisan_header) {
    print " Datum: $datum\n";
    print " sat : broj pristupa\n";
    print "-------------------------------\n";
    $ispisan_header = 1;
  }

  if ($ispisan_header) {
    @args = split /:/, $redak;
    $sat = @args[1];
    @ispis[$sat] += 1;
  }

  if (eof) {
    foreach (0..23) {
      printf "  %02d : %d\n", $_, @ispis[$_];
      @ispis[$_] = 0;
    }
    print "\n";

    $ispisan_header = 0;
  }
}