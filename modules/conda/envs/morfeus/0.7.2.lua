help([[
Morfeus calculates molecular features from 3D structures with a focus on steric 
descriptors. It can be used as a Python library or through command line scripts.

Several optional dependencies are installed including:

  RDKit: a collection of cheminformatics and machine-learning software written in 
          C++ and Python
  OpenBabel: a chemical toolbox designed to speak the many languages of chemical data.
  CREST: Conformer-Rotamer Ensemble Sampling Tool based on the xtb Semiempirical 
          Extended Tight-Binding Program Package
  xtb: semiempirical extended tight-binding program package
  xtb-python: a Python API for the xtb program (depricated)
]])

-- conda environment name
local env="morfeus-0.7.2"

-- extensions aid in documenting the python version provided
extensions("python/3.11")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
