help([[
BLAST+ is a suite of programs provided by NCBI for aligning query sequences against those present in a selected target database. The NCBI BLAST homepage (https://blast.ncbi.nlm.nih.gov) provides an access point for these tools to 
perform sequence alignment on the web.

Activates the blast+ conda environment.
]])

-- conda environment name
local env="blast-2.14"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
