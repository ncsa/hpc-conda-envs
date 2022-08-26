# hpc-conda-envs
This repository provides conda environment files and matching LMOD files that are generally useful in a shared multi-user HPC cluster environment.
Users are able to use either module commands or conda commands to manage active environments. The following two commands would be considered equivalent.

```bash
module load conda/env/jupyter 
conda activate jupyter
```


## Installation
The installation assumes that LMOD has already been installed on the system.

1. Install miniconda3 at a shared location such as /usr/local/miniconda3.
Answer "no" when asked to initialize Miniconda3.
1. Activate conda's base environment using the 'eval' command shown following
the install.
1. (optional -- recommended) Add mamba to the base environment using `conda  
install -c conda-forge mamba`. Mamba is a fast drop-in alternative to conda.
1. Edit the modules/miniconda3.lua file to point to the local miniconda3 installation.
1. Recursively build the conda environments using `find . -name \*.yml -exec mamba env   
create -f {} \;`. This will build multiple conda environments and store them under the
local miniconda3 installation.
1. Recursively copy every thing under the repository modules directory into the system 
modules directory using `cp -r modules/* <system_module_directory>`.
1. Recursively fix permissions on the ENTIRE miniconda3 installation and conda modules with
`chmod -R g-w,o+rX /usr/local/miniconda3 /usr/local/modulefiles/conda`.

Remember to fix permission on the miniconda3 installation after any changes to conda
environments.

