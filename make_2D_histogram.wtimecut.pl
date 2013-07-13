#!/usr/bin/perl -w
use POSIX;

########## global variables ####################
$usage = "\nUsage: \.\/make_2D_histogram\.pl  [data file]  [y-column] [y-min] [y-max] [y-resolution]  [x-column] [x-min] [x-max] [x-resolution] [TimeCut] [outputFileName]\n
\t\[Note 1\: be sure to subtract 1 from each desired column number\] 
\t\[Note 2\: resolutions should be given as a fraction of an integer, such as \"0.5\", which would be the bin width\]
\n";

$data  = $ARGV[0] || die "$usage\n";
$Ycol  = $ARGV[1] || die "$usage\n";
$Ymin  = $ARGV[2] || die "$usage\n";
$Ymax  = $ARGV[3] || die "$usage\n";
$Yres  = $ARGV[4] || die "$usage\n";
$Xcol  = $ARGV[5] || die "$usage\n";
$Xmin  = $ARGV[6] || die "$usage\n";
$Xmax  = $ARGV[7] || die "$usage\n";
$Xres  = $ARGV[8] || die "$usage\n";
$TimeCut = $ARGV[9] || die "$usage\n";
$output = $ARGV[10] || die "$usage\n";


$maxX = floor((($Xmax - $Xmin)/$Xres));
$maxY = floor((($Ymax - $Ymin)/$Yres));


##  Initializing
for ($i=0;$i<$maxY;$i++){
    for ($j=0;$j<$maxX;$j++){
        $BIN{"$i:$j"} = 0;
    }
}

### open and read in the file and  ### 
$totaldata = 0;
open(INP,"<$data");
while ($line = <INP>) {
    chomp $line;
    for($line) { s/^\s+//;s/\s+$//; s/\s+/ /g; }
    @lines = split(/ /,$line);
    if ($lines[3]>=$TimeCut){ #specify column where time is located
        $x = (($lines[$Xcol] - $Xmin)/$Xres) + 0.5;
        $y = (($lines[$Ycol] - $Ymin)/$Yres) + 0.5;
        $newx = floor($x);
        $newy = floor($y);
        $BIN{"$newy:$newx"}++;
        $totaldata++;
    }
}
close(INP);
$totdat = $totaldata;
print STDOUT "Total data points read = $totdat\n\n";


### and print out the resulting matrix  ###
open(OUT,">$output");

for ($yy=0;$yy<$maxY;$yy++) {
  for ($xx=0;$xx<$maxX;$xx++) {
      printf OUT "%8d", $BIN{"$yy:$xx"};
      print "$BIN{\"$yy:$xx\"}\t";
  } 
  print OUT "\n";
  print "\n";
}
print "\n";
close(OUT);
