#!/usr/bin/perl
##Holiday_Wang------------
## To check the command line option
my $hmmscan="/public/home/zengqifan/anaconda3/bin/hmmscan";
my $OGpath="/public/home/test10/ZRG-GOAO/comparative-genomics/7.7proteins/OrthoFinder/Results_Jul13_3/Orthogroup_Sequences/";
my $outputpath="/home/zengqifan/wanghao/2020/OG-pfam/";
my $pfam_db="/home/zengqifan/wanghao/2020/OG-pfam/Pfam-A.hmm";
if($#ARGV<0){
    printf("Usage: \n <list> <database> <output_Column_number> <outfile>\n");
        exit 1;
        }


 open OG,"<$ARGV[0]";
 #open IN,"<$ARGV[1]";
 #open OUT,">$ARGV[3]";
 while(<OG>){
	 chomp;
	@gene_OG = split(/\t/,$_);
	$gene = $gene_OG[0];
	$OG_hash{$gene} = $gene_OG[1];

 }
foreach(keys %OG_hash){
	system "$hmmscan --tblout $outputpath$_.hit --cpu 16  $pfam_db $OGpath$OG_hash{$_}.fa";
}
close OG;
