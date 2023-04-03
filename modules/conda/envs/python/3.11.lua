help([[
  Python is a high-level, dynamically typed programming language.
  This module provides Python 3.11 and its standard library.
]])

whatis("Name: Python")
whatis("Version: 3.11.2")
whatis("Category: programming, language")
whatis("Description: Python programming language")
whatis("URL: https://www.python.org")

-- conda environment name
local env="python-3.11"

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
