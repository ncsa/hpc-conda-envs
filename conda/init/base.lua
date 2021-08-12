help([[
Loads the miniconda base environment. The base environment contains minimal 
number of Python packages and is generally only used for building other
conda environments.
]])

-- conda environment name
local env="base"

-- extensions aid in documenting the python version provided
extensions("python/3.9.2")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("conda/init")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
