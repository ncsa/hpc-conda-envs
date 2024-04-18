help([[
Pairtools is a simple and fast command-line framework to process sequencing 
data from a Hi-C experiement.

This module loads a conda environment.
]])

whatis("Version: 1.0.3")
whatis("Home: https://github.com/open2c/pairtools")
whatis("Documentation: https://pairtools.readthedocs.io")

-- conda environment name
local env="pairtools-1.0.3"

-- extensions aid in documenting the python version provided
extensions("python/3.10")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
