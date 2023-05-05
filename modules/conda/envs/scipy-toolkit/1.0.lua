help([[
The scipy toolkit is a general-purpose, scientific computing environment with
Python 3.8 and many packages cover a wide set of use cases including:

  Data Processing and Analysis
  Image Processing and Computer Vision
  Visualization and Plotting
  Web Development and Templating
  Machine Learning and Data Science
  Networking and Communication
  Asynchronous Programming and Concurrency
  File I/O and Data Storage
  Utilities and General-Purpose Libraries
  Cryptography and Security

To see every package install use the command 'conda list -n scipy-toolkit-1.0'.
]])

-- conda environment name
local env="scipy-toolkit-1.0"

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
