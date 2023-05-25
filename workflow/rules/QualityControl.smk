rule preprocess_reads:
    input:
        read_1 = "reads/ERR3265077_1.fastq.gz",
        read_2 = "reads/ERR3265077_2.fastq.gz"
    output:
        preprocess_read_1 = "preprocessed_reads/ERR3265077_1.fastq.gz",
        preprocess_read_2 = "preprocessed_reads/ERR3265077_2.fastq.gz"
    message: "Filter out bad reads"
    shell:
        "tools/fastp/fastp -i {input.read_1} -I {input.read_2} -o {output.preprocess_read_1} -O {output.preprocess_read_2}"