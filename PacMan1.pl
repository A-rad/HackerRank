#!/usr/bin/perl
$pack = <STDIN>;
chomp($pack);
foreach ($pack) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@pacman = split(//, $pack);
$py = $pacman[0];
$px = $pacman[1];

$food = <STDIN>;
chomp($food);
foreach ($food) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@foo = split(//, $food);
$fy = $foo[0];
$fx = $foo[1];

$boxsize = <STDIN>;
chomp($boxsize);
foreach ($boxsize) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@size = split(//, $boxsize);
$indexi = $size[0];
$indexj = $size[1];

for ($in=0; $in<$indexi; $in++) {
	$line = <STDIN>;
	chomp($line);
	@gridA = split(//, $line);
	$gridA = [ @gridA ];
	push (@grid, $gridA);
}

dfs($indexi, $indexj,$px,$py, $fx, $fy, @grid);


sub dfs {
	my($indexi, $indexj, $px, $py, $fx, $fy, @grid) = @_;
	



}
