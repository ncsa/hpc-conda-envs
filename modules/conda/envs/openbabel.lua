help([[
Open Babel is a chemical toolbox designed to speak the many languages 
of chemical data. It's an open, collaborative project allowing anyone 
to search, convert, analyze, or store data from molecular modeling, 
chemistry, solid-state materials, biochemistry, or related areas.

Activates the openbabel conda environment including the obabel command line
interface.
]])

-- conda environment name
local env="openbabel"

-- extensions aid in documenting the python version provided
extensions("python/3.9.2")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
