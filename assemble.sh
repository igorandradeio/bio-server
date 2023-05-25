#test
#tools/MEGAHIT/bin/megahit --test

#Assemble
tools/MEGAHIT/bin/megahit -1 data/sample_01.fastq.gz -2 data/sample_02.fastq.gz -o output-megahit

# get FASTG from the intermediate contigs of k=119
tools/MEGAHIT/bin/megahit_core contig2fastg 119 output-megahit/final.contigs.fa > k119.fastg