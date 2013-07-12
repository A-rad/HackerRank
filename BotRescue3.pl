#!/usr/bin/perl
$n=5;
## Reading in Bots position and setting up comparison
$linea = <STDIN>;
chomp($linea);
foreach ($linea) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@bot = split(/ /, $linea);

$by = $bot[0];
$bx = $bot[1];

## Reading in the grid in a 2D array so elements are easily accessable
for ($in=0; $in<$n; $in++) {
	$line = <STDIN>;
	chomp($line);
	$line =~ s/([-])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([-])/$1 $2/gi;  

	$line =~ s/([b])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([b])/$1 $2/gi;

	$line =~ s/([d])([^ ])/$1 $2/gi;  
	$line =~ s/([^ ])([d])/$1 $2/gi;

	foreach ($line) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
	@gridA = split(/ /, $line);
	$gridA = [@gridA];
	push (@grid, $gridA);
}
## Running subroutine
next_move($mx, $my, @grid);

## Defining subroutine
sub next_move {

	my($mx, $my, $grid) = @_;
	$n=5;	
	for ($i=0; $i<$n; $i++) {
		for ($j=0; $j<$n; $j++) {
			if ($grid[$i][$j] eq "d") {  ## Identifying dirty cells
				$dy = $i;
				$dx = $j;
				$dirtdis = sqrt(($dx-$bx)^2 + ($dy-$by)^2);## Comparing dirty cell distance to bot
				$getit{$dirtdis} = "$dx"."$dy";
			}
		}
	}
## Arranging a list for the bot to handle based on distance to bot
	foreach $dirtycell (sort keys %getit) {
	@dirtpos = split(//,$getit{$dirtycell});	
	$orderget = [("$dirtpos[0]", "$dirtpos[1]")];
	push (@botget, $orderget);
	}	

	if (($botget[0][0] == $bx)&&($botget[0][1] == $by)) { print "CLEAN\n";}
	else {
		$dirx = $botget[0][0] - $bx;
    		if ($dirx > 0 ) {
			print "RIGHT\n"; 
			
		}
    		elsif ($dirx < 0 ) {
			 print "LEFT\n"; 
		
		}
   		elsif ($dirx == 0) { 
        		$diry = $botget[0][1] - $by;
        		if ($diry < 0 ) {
        	    		print "UP\n"; 	
			}
       	 		elsif ($diry > 0 ) {
           			print "DOWN\n";
	    		}
			elsif ($diry == 0) {
				print "CLEAN\n";
				splice (@botget, 0, 1);
			}	
    		}
	}
}
# Tail starts here
