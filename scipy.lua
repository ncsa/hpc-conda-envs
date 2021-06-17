help([[
Activates the scipy conda environment. This environment provides a basic
set of Python numeric libraries.
]])

-- conda environment name
local env="scipy"

-- extensions aid in documenting the python version provided
extensions("python/3.9.2")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("conda/init")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
