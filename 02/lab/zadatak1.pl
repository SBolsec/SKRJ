#!/bin/perl

while (<>) {
    if (/^(From nobody)/) {
        @line = split / /, $_;
        $map{@line[2]}++;
    }
}

@days = qw / Mon Tue Wed Thu Fri Sat Sun /;

foreach (@days) {
    print "$_ " . "*" x %map{$_} . "(" . %map{$_} . ")\n";
}