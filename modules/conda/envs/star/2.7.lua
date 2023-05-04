help([[
STAR is a popular RNA-seq aligner that can align both RNA and DNA sequences.
]])

whatis("Version: 2.7.10b")
whatis("Keywords: RNA-seq, bioinformatics")
whatis("URL: https://github.com/alexdobin/STAR")
whatis("Description: STAR is a RNA-seq aligner that can align both RNA and DNA sequences.")

-- conda environment name
local env="star-2.7"

-- extensions aid in documenting the python version provided
extensions("python/3.11.0")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
