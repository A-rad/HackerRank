#!/usr/bin/perl 
use POSIX;

########## global variables ####################
$data1 = $ARGV[0] || die "Unable to open the first file";
$data2 = $ARGV[1] || die "Unable to open the second file";

open(INP1, "<$data1");
while ($line = <INP1>) {
    chomp($line);
    for($line) { s/^\s+//;s/\s+$//; s/\s+/ /g;}
    @lineuseful  = split(/ /, $line);
    $num = [@lineuseful];
    push @data1, $num;
}
close(INP1);

open(INP2, "<$data2");
while ($line = <INP2>) {
    chomp($line);
    for($line) { s/^\s+//;s/\s+$//; s/\s+/ /g;}
    @lineuseful  = split(/ /, $line);
    $num = [@lineuseful];
    push @data2, $num;
}
close(INP2);
$index = scalar(@data2);

for ($i=0; $i<$index;$i++){
    if ($data1[$i][9] != $data2[$i][9]){
        print "$data[$i][9]   is different from   $data[$i][9]\n";
    }
}