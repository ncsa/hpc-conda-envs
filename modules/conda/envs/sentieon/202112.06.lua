help([[
Activates the sentieon conda environment. Accelerated performance 
bioinformatics tools for mapping and variant calling.
https://www.sentieon.com/
]])

-- conda environment name
local env="sentieon-202112.06"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
