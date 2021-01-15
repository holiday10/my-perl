#!/usr/bin/perl
#Holiday_Wang------------
# To check the command line option
if($#ARGV<1){
    printf("Usage: \n <list> <database> <output_Column_number> <outfile>\n");
    exit 1;
}

my $ortho_family = $ARGV[0];
open IN,"<$ARGV[1]";
open OUT,">$ARGV[2]";

while(<IN>){
	 chomp;
	 @arry = split(/\t/,$_);
	print OUT qq(printf "@arry\\t" >> core.g3 && ) ;
	print OUT qq(awk -F '\\t' '\$$arry[0] !=0 && \$$arry[1] !=0 && \$$arry[3] !=0 ' $ortho_family | wc -l >> core.g3 \n);
}

 close IN;
 close OUT;
 