#!/usr/bin/perl
for ($i=0; $i<5; $i++) {
	for ($j=0; $j<5; $j++) {
		$dir = sqrt(0);
		$list{$dir} = "$i"."$j";
}}
#$index = scalar(%list);
#$another{$#list} = ('1', 'pos 9');
#push %list $another{$#list};




#%list = ( '5', "pos 1  blah",'3', 'pos 2', '8', 'pos 3', '2', 'pos 4' );

foreach $x (sort keys %list) {
	#print "$x  $list{$x}\n";
	@dirtpos = split(//, $list{$x});	
	print 	"$dirtpos[0] $dirtpos[1]\n";
	$orderget = [("$dirtpos[0]", "$dirtpos[1]")];
	push (@botget, $orderget);
	}	

print "$botget[0][0]   $botget[0][1]\n";

splice (@botget, 0, 1);
print "$botget[0][0]   $botget[0][1]\n";

