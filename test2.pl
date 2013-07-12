$size = 7;
@array = (5,8,1,3,7,9,2);

quickSort(@array);

sub quickSort {
    (@testarray) = @_;
    $size = scalar(@testarray);
    if ($size>1) {
        #print "Start with @testarray"."\n";
        @testarray = partSort(@testarray);
    }
    return (@testarray);
}

sub partSort {
    my (@narray) = @_;
    $size = scalar(@narray);
    my $mid = $narray[0];
    shift(@narray);
    my @less= ();
    my @great = ();
    #print "Calling partSort on @narray\n";
    
    for ($i=0;$i<$size;$i++){
	if (defined($narray[$i])) {
	    if ($narray[$i]<$mid) {
		#print "Less $narray[$i]\n";
		push (@less, $narray[$i]);
	    }
	    elsif($narray[$i]>$mid){
		#print "greater $narray[$i]\n";
		push (@great, $narray[$i]);
	    }
	}
    }
    #print "Starting the less array quickSort\n";
    #print "@less\n";
    my (@less) = quickSort(@less);
    push (@less,$mid);
    #foreach $x (@less) {
	#if (defined($x)){
	 #   print "$x ";
        #}
    #}
    #print "\n";
    #print "... the great array quickSort\n";
    my (@great) = quickSort(@great);
    #foreach $y (@great) {
	#if (defined($y)){
	#    print "$y ";
        #}
    #}
    #print "\n";    
    splice(@less, @less, 0, @great);
    foreach $x (@less) {
	if (defined($x)){
	    print "$x ";
        }
    }
    print "\n";
    return (@less); 
}
