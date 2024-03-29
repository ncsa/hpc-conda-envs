help([[
Activates the homer conda environment. Homer is a suite of tools
for Motif Discovery and next-gen sequencing analysis.
http://homer.ucsd.edu/homer/
]])

-- conda environment name
local env="homer"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
