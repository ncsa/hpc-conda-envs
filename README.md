# hpc-conda-envs
This repository provides conda environment files and matching LMOD files that are generally useful in a shared multi-user HPC cluster environment.
Users are able to use either module commands or conda commands to manage active environments. The following two commands would be considered equivalent.

```bash
module load conda/env/jupyter 
conda activate jupyter
```


## Installation
The installation assumes that LMOD and miniconda3 have already been installed on the system. 

```bash
cd /tmp
wget https://github.com/ncsa/hpc-conda-envs/archive/master.tar.gz
tar xzf /tmp/master.tar.gz --directory /module/directory --strip-components=1
conda env update -f /module/directory/conda/init/base.yml
find /module/directory/conda/env -name \*yml | xargs conda env create -f
```
