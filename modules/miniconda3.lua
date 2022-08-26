help([[
This module loads the conda shell functions and variables but does NOT 
activate any conda environments. After loading, conda environments can
be activated using 'conda activate <env>'. For complete list of available
environments run 'conda env list'.

For additional information see https://github.com/ncsa/hpc-conda-envs.
]])

module-whatis  "         Name: miniconda3"
module-whatis  "      Version: 4.12"
module-whatis  "  Description: Miniconda3 provides conda and a minimal python3 installation."
module-whatis  "             : The conda command can be used create python environments"
module-whatis  "             : with different python versions and sets of packages."
module-whatis  "          URL: https://docs.conda.io/en/latest/miniconda.html"


local root = "/usr/local/miniconda3"

-- load the conda shell functions
local cmd = "source " .. root .. "/etc/profile.d/conda." .. myShellType()
execute {cmd=cmd, modeA={"load"}}

-- this happens at unload
if (mode() == "unload") then

  -- csh sets these environment variables and an alias for conda
  if (myShellType() == "csh") then
    cmd = "unsetenv CONDA_EXE; unsetenv _CONDA_ROOT; unsetenv _CONDA_EXE; " ..
          "unsetenv CONDA_SHLVL; unalias conda"
    execute{cmd=cmd, modeA={"unload"}}
  end

  -- bash sets environment variables, shell functions and path to condabin
  if (myShellType() == "sh") then
    remove_path("PATH", pathJoin(root,"condabin"))
    cmd = "unset CONDA_EXE; unset CONDA_PYTHON_EXE; " ..
        "unset _CE_CONDA; unset CONDA_SHLVL; unset -f conda; " ..
        "unset -f __conda_activate; unset -f __conda_reactivate; " ..
        "unset -f __conda_hashr; unset -f __add_sys_prefix_to_path"
    execute{cmd=cmd, modeA={"unload"}}
  end
end
