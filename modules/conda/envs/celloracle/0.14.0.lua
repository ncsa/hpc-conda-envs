help([[
CellOracle is a python library for the in silico gene perturbation 
analysis using single-cell omics data and gene regulatory network models.

This conda environmment also works as a Jupyter kernel so notebooks
started using OnDemand can use it as a kernel.
]])

-- conda environment name
local env="celloracle-0.14.0"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
