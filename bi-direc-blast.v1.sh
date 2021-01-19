#!/bin/sh


##best-hit
i=0
awk '!a[$1]++{print}' $1 > $1-$i
awk '!a[$1]++{print}' $2 > $2-$i

## bidirction-best hit
awk '{print $1"|"$2"\t"$0}' $1-$i > $1-$i.u
awk '{print $2"|"$1"\t"$0}' $2-$i > $2-$i.u


cat $1-$i.u $2-$i.u | cut -f 1 |sort -k1 |uniq -d |sed 's/|/\t/' > $1-$2.bdb.$i.link

line=100

while (( $line>=1 ))
do 
	sed 's/\t/\n/' $1-$2.bdb.$i.link > $i.hit.list
	let i+=1

	fgrep -v -w -f $(($i-1)).hit.list $1 | awk '!a[$1]++{print}' > $1-$i 
	fgrep -v -w -f $(($i-1)).hit.list $2 | awk '!a[$1]++{print}' > $2-$i
	## bidirction-best hit
	awk '{print $1"|"$2"\t"$0}' $1-$i > $1-$i.u
	awk '{print $2"|"$1"\t"$0}' $2-$i > $2-$i.u
	
	cat $1-$i.u $2-$i.u | cut -f 1 |sort -k1 |uniq -d |sed 's/|/\t/' > $1-$2.bdb.$i
	
	cat $1-$2.bdb.$(($i-1)).link $1-$2.bdb.$i > $1-$2.bdb.$i.link
	line=$(cat $1-$2.bdb.$i |wc -l)
done

printf "------external bidirectional blast process done !!!---\n---start next round file preparation\n"


cat $1 $2 | cut -f 1,2 |sed 's/\t/\n/' |sort -u > $1-$2.all.hit.list
grep -v "^${2%-r*}" $1-$2.all.hit.list > ${1%-*}.hit.list
grep "^${2%-r*}" $1-$2.all.hit.list > ${2%-r*}.hit.list
grep ">" $3 |sed 's/>//' > all.${1%-*}.list
grep ">" $4 |sed 's/>//' > all.${2%-r*}.list

cut -f 1 $1-$2.bdb.$i.link |fgrep -v -w -f - ${1%-*}.hit.list > ${1%-*}.soft
cut -f 2 $1-$2.bdb.$i.link |fgrep -v -w -f - ${2%-r*}.hit.list > ${2%-r*}.soft
fgrep -w -v -f ${1%-*}.hit.list all.${1%-*}.list > ${1%-*}.cloud
fgrep -w -v -f ${2%-r*}.hit.list all.${2%-r*}.list > ${2%-r*}.cloud
seqtk subseq $4 ${2%-r*}.soft > ${2%-r*}.soft.cds
seqtk subseq $4 ${2%-r*}.cloud > ${2%-r*}.cloud.cds

printf "file-preparation done !\n"


