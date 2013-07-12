#!/usr/bin/perl
$pack = <STDIN>;
chomp($pack);
foreach ($pack) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@a = split(//, $pack);
$index = scalar(@a);
#print "The index is $index\n";
if ($index == 1){
	print "YES\n";
	exit();
}

$odd = 0;
if (($index % 2) == 1){
	$odd++;	
}
#print "odd is now $odd\n";

@b = sort (@a);

$AreWeGood= "NO";

$counter = 0;
for($i=0;$i<$index;$i++){
	#print "$b[$i]  ";
	if ($b[$i] eq $b[$i+1]){
		$counter++;
	}
	else {
		$counter++;
		push @counts, $counter;
		$counter = 0;
	}
	#print "$counter \n";
}

$indexb = scalar(@counts);
#print "There are $indexb"." in the array counts\n";
for ($j=0;$j<$indexb;$j++){
	#print "$counts[$j]\n";
	$check = $counts[$j] % 2;
	if ($check == 0){
		$AreWeGood = "YES";
	}
	if ($check == 1){
		$odd++;
	}
}
if ($odd > 2){
	print "NO\n";
	$AreWeGood = "NO";
}
elsif ($AreWeGood eq "YES"){
	print "YES\n";
}

