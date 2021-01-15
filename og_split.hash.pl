#!/usr/bin/perl
#Holiday_Wang------------
# 
if($#ARGV<0){
    printf("Usage: \n <OGfile> \n");
    exit 1;
}


open DB,"<$ARGV[0]";

while(<DB>){
	 chomp;
	 @OGlog = split(/\t/,$_);
	 $index = @OGlog[0];
	 shift @OGlog;
	 $protein = join('',@OGlog);
	 $OGhash{$index} = $protein; 
	}
foreach(keys %OGhash){
     
		open OUT, ">$_.fa";
		$value = $OGhash{$_}
		print OUT "$value\n";
		close OUT;
}
