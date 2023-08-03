help([[
PLINK: A Tool Set for Whole-Genome Association and Population-Based Linkage Analyses

Note: this is plink version 1.90b6.22. Plink2 is available as part of the
genomic-tool kit module.
]])

-- conda environment name
local env="plink-1.90b"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
