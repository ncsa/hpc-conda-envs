help([[
The genomic-toolkit module provides a collection of popular bioinformatics
tools for working with genomic data. This module includes the following tools:

  - samtools: Tools for manipulating SAM, BAM, and CRAM files
  - htslib: A C library for high-throughput sequencing data formats
  - bcftools: Tools for working with VCF and BCF files
  - bedtools: Utilities for comparing and manipulating BED, GFF/GTF, 
      and VCF files
  - bwa: A fast and accurate short-read aligner
  - bowtie2: An ultrafast memory-efficient short-read aligner
  - picard: A set of Java-based command-line tools for manipulating 
      high-throughput sequencing data
  - plink2: A Tool Set for Whole-Genome Association and Population-Based
       Linkage Analyses
  - sra-tools: Tools for working with the Sequence Read Archive (SRA)
  - fastqc: A quality control tool for high-throughput sequence data
  - gwama: Meta-analysis of summary statistics generated from genome-wide
       association studies of dichotomous phenotypes or quantitative traits.
  - trimmomatic: A flexible read trimming tool for Illumina NGS data
  - hisat2: A fast and sensitive alignment program for mapping RNA-seq reads
  - pysam: A Python library for reading, manipulating, and writing 
      SAM/BAM/VCF/BCF files
  - biopython: A set of freely available tools for biological computation in Python
  - mosdepth:
  - pairtools:
  - tabulate:
]])

-- conda environment name
local env="genomic-toolkit-1.2"

-- extensions aid in documenting the python version provided
extensions("python/3.10")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
