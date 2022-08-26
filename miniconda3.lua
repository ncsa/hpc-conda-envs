help([[
This module loads the conda shell functions and variables but does NOT 
activate any conda environments. It is loaded automatically by the 
various conda/env modules and users are encouraged to use those directly.
]])

local root = "/usr/apps/general/miniconda3"

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
