help([[
  R is a language and environment for statistical computing and graphics.
  This module provides version 4.2.0 of R programming language.
  reference conda base is at: https://anaconda.org/conda-forge/r-base
]])

whatis("Name: R")
whatis("Version: 4.2.0")
whatis("Status: Recommended")
whatis("Category: programming, language")
whatis("Description: R programming language")
whatis("URL: https://www.r-project.org")

-- conda environment name
local env="R-4.2.0"

-- extensions aid in documenting the python version provided

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}