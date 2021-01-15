#!/usr/bin/perl
#Holiday_Wang------------
# To check the command line option
if($#ARGV<0){
    printf("Usage: \n <list> <database> <output_Column_number> <outfile>\n");
    exit 1;
}

open FL,"<$ARGV[0]";
open IN,"<$ARGV[1]";
open OUT,">$ARGV[2]";

while(<IN>){
	 chomp;
	 @AA_s = split(/\t/,$_);
	 $aa = $AA_s[0];
	
	$AAs_S{$aa} = $_;

}

while(<FL>){
	 chomp;
	 if ( />/ ) {
		 print OUT "$_\n";
	 }else{
	$line = $_ ;
	$line = ~ s/(\S)/\1\n/g ;
	print OUT "$_\n";
	 }
}



 close FL;
 close IN;
 close OUT;

open OUT,"<$ARGV[2]";
open OUT2,">$ARGV[3]";
while(<OUT>){
	 chomp;
 	 if (exists $AAs_S{$_}) {
	#$Column_No=$ARGV[2]-1;
	@generow = split(/\t/,$AAs_S{$_});
	#$Column_No=$ARGV[2]-1;
	$N = 3- $generow[-1];
	print OUT2 "$AAs_S{$_}\t$N\n";
	 }else{
		 print OUT2 "$_\n"; }
 }

 close OUT2;
 close OUT;
