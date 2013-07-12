#!/usr/bin/perl
$pack = <STDIN>;
chomp($pack);
foreach ($pack) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@a = split(//, $pack);
$indexa = scalar(@a);

foreach $x (@a) {
	print "$x ";
}
print "\n";
