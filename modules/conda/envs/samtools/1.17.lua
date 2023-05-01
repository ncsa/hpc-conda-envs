help([[
This module provides the following tools:

Samtools:
  Samtools is a suite of programs for interacting with high-throughput
  sequencing data (BAM, CRAM, and SAM formats). It provides various utilities
  for manipulating alignments, including sorting, merging, indexing, and
  generating alignments in a per-position format.

BCFtools:
  BCFtools is a set of utilities for variant calling and manipulating VCFs
  (Variant Call Format) and BCFs (Binary Call Format). It provides utilities for
  calling variants, filtering, consensus calling, and various VCF/BCF 
  manipulation tasks.

HTSlib:
  HTSlib is a C library for high-throughput sequencing data formats. It provides
  a common API for reading and writing various file formats such as SAM, BAM,
  CRAM, VCF, and BCF.

More information is available at https://www.htslib.org/.
]])

-- conda environment name
local env="samtools-1.17"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
