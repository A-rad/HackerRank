#!/usr/bin/perl
use POSIX;
#####  Reading in the string
$pack = <STDIN>;
chomp($pack);
foreach ($pack) { s/^\s+//; s/\s+$//; s/\s+/ /g;}
@a = split(//, $pack);
$index = scalar(@a);
### Checking to see if its longer than 1
if ($index == 1){
	print "1\n";
	exit();
}
print "The length of a is $index\n";
$odd = 0;
#### Sorting 
@b = sort (@a);
print "The sorted a is ";
foreach $x (@b){
	print "$x ";
}
print "\n";
#### Counting how many of each letter there is
$AreWeGood= "YES";
$counter = 0;
for($i=0;$i<$index;$i++){
    $c = $i+1;
    print "Comparing $b[$i] and $b[$c] \n";
	if ($b[$i] eq $b[$c]){
		$counter++;
		print "Count plus one! \n";
		
	}
	elsif ($c == $index){
		$counter++;
		push @counts, $counter;
		print "No more.. the total letter count is $counter\n";
		$counter = 0;
	}
	else {
		$counter++;
		push @counts, $counter;
		print "No more.. the total letter count is $counter\n";
		$counter = 0;
	}
}
#### Making sure it is a Palin... whatever.
$indexb = scalar(@counts);
for ($j=0;$j<$indexb;$j++){
	if (($counts[$j] % 2) == 0){   #If the string is even proceed to take permuation
		print "THis is a palin.. whatever\n";
	}
	else {
		# Checking if there is more than one odd letter
		$odd++;
		print "Found an odd!!  Watch out!\n";
	}
}
#### Checking if there is more than one odd value
if ($odd >= 2){       #If there are too many odd characters, print 0
	print "0\n"; 
	$AreWeGood = "NO";
	print "Nope... not good\n";
	exit();
}
####  Starting permutation enumertion for the string
if ($AreWeGood eq "YES") {
	$r = 0;
	for ($j=0;$j<$indexb;$j++){  #For each letter
		print "Looking at $counts[$j]..\n";
		if ($counts[$j] >= 1){  # Is there more than one letter
			if (($counts[$j] % 2) == 0){  ### Is there an even amount
				print "It's, even  ";
				$r += ($counts[$j]/2);  ## take half and add to perm size 
				$value = ($counts[$j]/2);  ## Account for degeneracy
				print "I am adding $value to perm size and degen array\n";
				push (@degen, $value);
			}
			else {
				if ($counts[$j] >= 3){ ## Is the odd letter count more than 3
					print "It's odd and 3 or more, ";
					$r += (floor(($counts[$j]/2)));	# take half and add to permsize
					$value = (floor(($counts[$j]/2)));  # account for degeneracy
					print "I am adding $value to perm size and degen array\n";
					push (@degen, $value);
				}
			}
		}
	}
	$indexc = scalar(@degen);
    $Btotal= 1;
    if ($indexc >= 1) {
        for ($l=0; $l< $indexc; $l++){
            $last = $Btotal;
            $Btotal = $last * factorial($degen[$l]);
        }
    }
    print "I am doing $r"."!"." divided by $Btotal\n";
	$answer = (factorial($r))/($Btotal);
	print "$answer\n";
	
}
#### If all else fails.. print 0.
elsif ($AreWeGood eq "NO"){
    print "0\n";
}
sub factorial(){
    my ($n) = @_;
	$total = 1;
	for ($k=$n;$k>0; $k--){
		$total = ($total) * $k;
	}
	return $total;
	
}