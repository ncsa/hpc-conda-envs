# hpc-conda-envs
This repository provides conda environment files and matching LMOD files that are generally useful in a shared multi-user HPC cluster environment.

## Installation
```bash
cd /tmp
wget https://github.com/ncsa/hpc-conda-envs/archive/master.tar.gz
tar xzf /tmp/master.tar.gz --directory /module/directory --strip-components=1
conda env update -f /module/directory/conda/init/base.yml
find /module/directory/conda/env -name \*yml | xargs conda env create -f
```
