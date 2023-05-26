rule megahit_assembly:
    input:
        r1="preprocessed_reads/1/paired-end/sample1.fastq.gz",
        r2="preprocessed_reads/1/paired-end/sample2.fastq.gz",
    output:
        directory("assembly/final.contigs.fa"),
    threads: 12
    shell:
        "tools/megahit/bin/megahit -1 {input.r1} -2 {input.r2} -o {output} -t {threads}"
