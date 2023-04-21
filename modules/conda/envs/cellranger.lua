help([[
Activates the cellranger conda environment. Cell Ranger is a set
of analysis pipelines that process Chromium single cell data to
align reads, generate feature-barcode matrices, perform clustering
and other secondary analysis, and more.
https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger
]])

-- conda environment name
local env="cellranger"

-- extensions aid in documenting the python version provided
extensions("python/3.9")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
