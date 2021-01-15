#!/usr/bin/perl
#Holiday_Wang------------
# To check the command line option
if($#ARGV<0){
    printf("Usage: \n <list> <database> <output_Column_number> <outfile>\n");
    exit 1;
}


open FL,"<$ARGV[0]";
open IN,"<$ARGV[1]";
open OUT,">$ARGV[3]";
while(<IN>){
	 chomp;
	 @gene_anno = split(/\t/,$_);
	 $gene_id = $gene_anno[0];
	
	$genes_anno{$gene_id} = $_;

}

 while(<FL>){
	 chomp;
	 if (exists $genes_anno{$_}) {
		 #	$Column_No=$ARGV[2]-1;
		@generow = split(/\t/,$genes_anno{$_});
		$Column_No=$ARGV[2]-1;
		print OUT "$_\t@generow[$Column_No]\n";
	 }else{
		 print OUT "$_\tNA\n"; }
 }
 close FL;
 close IN;
 close OUT;
