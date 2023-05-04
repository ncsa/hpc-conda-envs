help([[
Activates the Jupyter conda environment. Use this environment when launching
any Jupyter service on the cluster. Python kernels from other conda environments
will be made available within the notebook service.

The version number currently tracks the jupyterlab release. Use the command,
'conda env export -n jupyter' to see versions of other jupyter packages.
]])

-- conda environment name
local env="jupyter-3.6"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
