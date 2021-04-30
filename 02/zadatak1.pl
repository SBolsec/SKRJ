#!/bin/perl

print "Unesite niz znakova: ";
chomp($string = <STDIN>);

print "Unesite broj ponavljanja: ";
chomp($n = <STDIN>);

while ($i < $n) {
    print $string, "\n";
    $i += 1;
}