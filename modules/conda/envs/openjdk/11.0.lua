help([[
  OpenJDK is an open-source implementation of the Java Platform, Standard 
  Edition (Java SE). Java SE is a general-purpose programming platform that
  can be used to develop applications.
]])

whatis("Name: openjdk")
whatis("Version: 11.0")
whatis("Category: programming, language")

-- conda environment name
local env="openjdk-11.0"

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
