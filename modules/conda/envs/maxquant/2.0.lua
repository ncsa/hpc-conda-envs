help([[
MaxQuant is a proteomics software package for label-free quantification of 
proteins and peptides.

This module loads a conda environment.
]])

whatis("Version: 2.0.3.0")
whatis("Keywords: proteomics, mass spectrometry")
whatis("URL: https://maxquant.net")
whatis("Description: MaxQuant is a computational proteomics software package used for analyzing mass spectrometry data.")

-- conda environment name
local env="maxquant-2.0"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
