# HPC Conda Environments (hpc-conda-envs)
This repository provides conda environment files and matching LMOD files that are generally useful in a shared multi-user HPC cluster environment. The repository provide detailed instruction when support Jupyter Notebooks under Open OnDemand(OOD).

## User Created Environments
This repository provides conda environments intended to be installed and admininstred by system administrators but users are able to leverage this installation to build their own custom environments. The custom environments will be created in the users home directory but symlinks to used to point to the system package cache reducing disk space usage and network transfer requirements.

To use a custom environment as a Jupyter kernel, only the appropriate kernel package (i.e. ipykernel, r-irkernel) needs to be installed in the environment. Do not include all the Jupyter packages. These are provided by system managed Jupyter environment.

## Integration with LMOD
Users are able to use either `module load` or `conda activate` to activate the conda environments. The following two commands would be considered equivalent.
```bash
module load conda/envs/jupyter 
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

## The Jupyter Environment
One common use case for this setup is to support Jupyter Notebooks under Open OnDemand (OOD).
In this case, a single environment provides the necessary Jupyter package and plugins to 
support the web interface. Other conda environments provide the kernel used to execute the 
notebook. The kernel environments can be selected interactively from Jupyter interface.

This approach provides several advantages. First, the Jupyter environment and plugins are managed
by system administrators and provide a consistent interface to all users. Second, commonly used
kernel environments can be provided to users in a consistent and documented manner. Third, users are 
still able to create their own kernels for custom computing needs. (See the section on User 
Environments).



