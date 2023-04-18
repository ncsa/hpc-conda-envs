help([[
help([[
Anaconda: Comprehensive Python and R Distribution for Data Science

Anaconda is a free, open-source distribution of Python and R programming
languages, designed specifically for data science, machine learning, and
scientific computing. It includes a wide range of pre-installed packages 
and libraries, simplifying the process of setting up a working environment
for these tasks. 

This module sets up the environment for using Anaconda and its bundled 
applications. To see the list of available packages in this distribution, 
use the 'conda list' command.

For more information, visit the official Anaconda website:
  https://www.anaconda.com/products/distribution
]])

whatis("Name: Anaconda")
whatis("Version: 2022.10")
whatis("Category: programming, language")
whatis("Description: Python programming language")
whatis("URL: https://www.python.org")

-- conda environment name
local env="anaconda-2022.10"

-- extensions aid in documenting the python version provided by modules
extensions("python/3.10")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
