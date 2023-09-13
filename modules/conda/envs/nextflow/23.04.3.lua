help([[
Perl is a highly capable, feature-rich programming language with over 30 
years of development. Perl 5 is a stable, mature, and portable programming
language that is suitable for a wide range of tasks, including text 
processing, web development, and bioinformatics.

This module includes Perl 5.32 and a selection of commonly used modules for
general programming and bioinformatics applications:

General Modules:
  - App::cpanminus: A script to get, unpack, build and install modules from CPAN
  - DateTime: Date and time handling
  - File::Slurp: Simple and Efficient Reading/Writing/Modifying of Complete Files
  - JSON: JSON (JavaScript Object Notation) encoder/decoder
  - LWP::Protocol::https: Provide https support for LWP::UserAgent
  - Try::Tiny: Minimal try/catch with proper localization of $@
  - URI: Uniform Resource Identifiers (absolute and relative)
  - XML::LibXML: Interface to Gnome libxml2 library providing XML and HTML parsers

Bioinformatics Modules:
  - Bio::Perl: A collection of bioinformatics-related Perl modules
  - Bio::Perl::Core: Core modules of the BioPerl distribution
  - Bio::DB::Sam: Interface to the SAMtools sequence alignment software
  - File::Spec: Portably perform operations on file names
  - Statistics::Distributions: Calculate critical values and upper probabilities
    of common statistical distributions

Learn more about Bioperl at https://bioperl.org

Note: this environment includes python. If you need a specific versions of
python, you should load it AFTER loading this module.
]])

-- conda environment name
local env="nextflow-23.04.3"

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate --stack " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
