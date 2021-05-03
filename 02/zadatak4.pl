#!/bin/perl

while (<>) {
  @data = split /;/, $_;
  @student = join " ", (@data[0], @data[1], @data[2]);
  $termin = @data[3];
  $zakljucano = @data[4];

  @term = split / /, $termin;
  @zaklj = split / /, $zakljucano;

  if (@term[0] eq @zaklj[0]) {
    @s1 = split /:/, @term[1];
    @s2 = split /:/, @zaklj[1];

    if (@s1[0] ne @s2[0]) {
      if (@s1[0] == @s2[0] - 1 and (@s2[1] > 0 or @s2[2] > 0)) {
        print "@student - PROBLEM: @term[0] @term[1] --> $zakljucano";
      }
    }
  } else {
    print "@student - PROBLEM: @term[0] @term[1] --> $zakljucano";
  }
}