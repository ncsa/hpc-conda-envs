help([[
The geospatial-toolkit/1.0 environment provides a collection of Python 
packages tailored for geospatial data processing, analysis, and 
visualization. This environment is suitable for various geospatial tasks, 
including vector and raster data manipulation, spatial analysis, and 
interactive map creation.

Key packages included in this environment:

General:
  - Python 3.8: A powerful and versatile programming language
  - NumPy: Fundamental package for numerical computing
  - Pandas: Data manipulation and analysis
  - Matplotlib & Seaborn: Plotting and visualization

Geospatial data processing:
  - GeoPandas: Geospatial data handling and manipulation
  - Fiona: Reading and writing geospatial data files
  - Shapely: Geometric objects manipulation and analysis
  - Pyproj: Cartographic projections and coordinate transformations
  - geos: 

Raster data processing:
  - Rasterio: Raster data reading, writing, and processing
  - Xarray: Multi-dimensional arrays with labeled axes
  - NetCDF4: NetCDF and HDF5 file handling
  - GDAL: Geospatial data abstraction library

Spatial indexing:
  - Rtree: Spatial indexing for large data sets

Map plotting and projections:
  - Cartopy: Cartographic tools and map projections
  - Descartes: Geometric objects plotting with Matplotlib
  - Folium: Interactive map creation with Leaflet.js
  - Mapclassify: Classification schemes for choropleth mapping
  - Contextily: Basemaps from online providers

Spatial analysis:
  - PySAL: Spatial analysis library
]])

-- conda environment name
local env="geospatial-toolkit-1.0"

-- extensions aid in documenting the python version provided
extensions("python/3.8")

-- always_load must be used because the conda3/init is unloaded (removing
-- all the conda functions) prior to the execution of conda deactivate
-- command when the load function is used.
always_load("miniconda3")

-- use conda to activate environments to ensure proper configuration
execute {cmd="conda activate " .. env, modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
