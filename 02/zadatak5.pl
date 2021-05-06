#!/bin/perl

if (@ARGV != 1) {
  die "Potrebno je predati ime datoteke s rezultatima.\n";
}

if (! open FILE, "<", "@ARGV[0]") {
  die "Pogreska kod otvaranja datoteke: $!\n";
}

sub calculate_score {
  my ($jmbag, $surname, $name, @scores);
  ($jmbag, $surname, $name, @scores) = @_;

  $key = "${surname}, ${name} (${jmbag})";
  $value = 0;

  foreach $i (0..6) {
    $value += @scores["$i"] * $shares["$i"];
  }

  $results{$key} = $value;
}

MAIN: while (<FILE>) {
  next if /^\s*$/; # skip blank lines
  next if /^\s*#/; # skip commented lines
  
  if (! defined($init)) {
    $init = 1;
    @shares = split /;/, $_;
    next MAIN;
  }

  &calculate_score(split(/;/, $_));
}

@sorted = sort { $results{$b} <=> $results{$a} } keys %results;

print "Lista po rangu:\n";
print "-------------------\n";

$i = 1;
foreach (@sorted) {
  printf "%3d. %-35s : %5.2f\n", $i, $_, $results{$_};
  $i += 1;
}