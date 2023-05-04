help([[
This module activates a conda environment that provides clusterOmega.

Clustalw provide multiple alignment of nucleic acid and protein sequences.
]])

whatis("Version: 1.2.4")
whatis("Keywords: RNA-seq, bioinformatics")

-- conda environment name
local env="clustalOmega-1.2"

-- extensions aid in documenting the python version provided
extensions("python/3.8.0")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
