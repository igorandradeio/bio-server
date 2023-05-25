
# Arquivo Snakefile

# Definindo as regras da pipeline

rule all:
    input:
        "reads/ERR3265077_1.fastq.gz",
        "reads/ERR3265077_2.fastq.gz",
        "preprocessed_reads/ERR3265077_1.fastq.gz",
        "preprocessed_reads/ERR3265077_2.fastq.gz"

rule download_read_1:
    output: "reads/ERR3265077_1.fastq.gz"
    message: "Downloading sample 1"
    shell: """
        wget -O {output} \
            ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR326/007/ERR3265077/ERR3265077_1.fastq.gz
    """

rule download_read_2:
    output: "reads/ERR3265077_2.fastq.gz"
    message: "Downloading sample 2"
    shell: """
        wget -O {output} \
            ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR326/007/ERR3265077/ERR3265077_2.fastq.gz
    """

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

# rule megahit_assembly:
#     input:
#         "preprocessed_reads/ERR3265077_1.fastq.gz",
#         "preprocessed_reads/ERR3265077_2.fastq.gz"
#     output:
#         "assembly/final.contigs.fa/final.contigs.fa"
#     shell:
#         "tools/megahit/bin/megahit -1 preprocessed_reads/ERR3265077_1.fastq.gz -2 preprocessed_reads/ERR3265077_2.fastq.gz -o assembly/final.contigs.fa/final.contigs.fa"

# # Pipeline settings file
# configfile: "config.yaml"