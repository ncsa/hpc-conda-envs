help([[
StringTie is a fast and highly efficient assembler of RNA-Seq alignments into potential transcripts. It uses a novel network flow algorithm as well as an optional de novo assembly step to assemble and quantitate full-length transcripts representing multiple splice variants for each gene locus. Its input can include not only alignments of short reads that can also be used by other transcript assemblers, but also alignments of longer sequences that have been assembled from those reads.

See the website https://ccb.jhu.edu/software/stringtie/ for more information.
]])

-- conda environment name
local env="stringtie-2.2"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
