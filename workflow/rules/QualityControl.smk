rule preprocess_reads:
    input:
        reads=expand("data/1/paired-end/sample{sample}.fastq.gz", sample=[1, 2]),
    output:
        preprocess_read_1="preprocessed_reads/1/paired-end/sample1.fastq.gz",
        preprocess_read_2="preprocessed_reads/1/paired-end/sample2.fastq.gz",
    message:
        "Filter out bad reads"
    shell:
        "tools/fastp/fastp -i {input.reads[0]} -I {input.reads[0]} -o {output.preprocess_read_1} -O {output.preprocess_read_2}"
