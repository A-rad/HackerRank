#!/usr/bin/perl
use POSIX;
$n = <STDIN>;
chomp($n);

$linea = <STDIN>;
chomp($linea);
foreach ($linea) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@mario = split(/ /, $line);

$mx = $mario[0];
$my = $mario[1];

for ($in=0; $in<$n; $in++) {
	$line = <STDIN>;
	chomp($line);
	$line =~ s/([-])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([-])/$1 $2/gi;  

	$line =~ s/([m])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([m])/$1 $2/gi;

	$line =~ s/([p])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([p])/$1 $2/gi;

	foreach ($line) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
	@gridA = split(/ /, $line);
	$gridA = [@gridA];
	push (@grid, $gridA);
}


nextMove($n, $mx, $my, @grid);

# Head ends here
sub nextMove {

	my($n, $mx, $my, $grid) = @_;
		for ($i=0; $i<$n; $i++) {
			for ($j=0; $j<$n; $j++) {
				if ($grid[$i][$j] eq "p") {
				 $py = $i;
				 $px = $j;				
				}
			}
		}
	$dirx = $px - $mx;
		if ($dirx > 0 ) {
		 do { print "DOWN\n"; $dirx = $dirx -1;
		} until ($dirx ==0);	
		}
		elsif ($dirx < 0 ) {
		 do { print "UP\n"; $dirx = $dirx +1;
		} until ($dirx ==0);	
		}
	$diry = $py - $my;
		if ($diry > 0 ) {
		 do { print "RIGHT\n"; $diry = $diry -1;
		} until ($diry ==0);	
		}
		elsif ($diry < 0 ) {
		 do { print "LEFT\n"; $diry = $diry +1;
		} until ($diry ==0);	
		}
}
# Tail starts here
