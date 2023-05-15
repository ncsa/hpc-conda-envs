help([[
Activates the bcl2fastq conda environment. bcl2fastq demultiplexes sequencing
data and converts base call (BCL) files into FASTQ files.
https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html
]])

-- conda environment name
local env="bcl2fastq2-2.20"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
