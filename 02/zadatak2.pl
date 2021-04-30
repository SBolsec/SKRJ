#!/bin/perl

print "Unesite niz brojeva:\n";
chomp(@list = <STDIN>);

foreach $broj (@list) {
    $sum += $broj;
}

$as = $sum / @list;

print "Aritmeticka sredina: ", $as, "\n";