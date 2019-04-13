This is a work-in-progress [website](https://fanwangecon.github.io/M4Econ/) of support files for solving various dynamic-optimization problems using Matlab, produced by [Fan](https://fanwangecon.github.io/). The codes focus on solving heterogeneous-agent dynamic asset problems in partial and general equilibrium. An attempt is made to show non-vectorized code for clarity, and vectorized code for efficiency.

Materials gathered from various [projects](https://fanwangecon.github.io/research) in which matlab codes are used. Matlab files are linked below by section. Various functions are stored in corresponding .m files. To use the files, clone the repository, and then source the [preamble.m](https://github.com/FanWangEcon/R4Econ/blob/master/preamble.m) file. Matlab results are stored in .mat files and analyzed using [base R](https://www.rdocumentation.org/packages/base/versions/3.5.2)/[tidyverse](https://www.tidyverse.org/) packages in Jupyter notebooks. The goal of this repository is to make it easier to find/re-use codes produced for various projects. See [here](docs/gitsetup.md) for github set up.

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

<!-- 1. [Linspace + Logspace Asset Grid](asset/grid/ff_grid_loglin.html): [**mlx**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.mlx) \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.m) \|  [**html**](asset/grid/ff_grid_loglin.html) \| [**pdf**](asset/grid/ff_grid_loglin.pdf) -->

# Asset Grids

1. [Linspace + Logspace Asset Grid](asset/grid/ff_grid_loglin.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.m) \|  html \| pdf |
    + *call*: ff_grid_loglin(it_a_vec_n, fl_amax, fl_amin, fl_loglin_threshold)
    + **core**: *while + logspace + start:gap:fin + unique*

# Table and Figure

1. [Add Columns to Table](table/ff_mat2tab.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/table/ff_mat2tab.m) \|  html \| pdf |
    + *call*: ff_mat2tab(mt_data, ar_st_colnames)
    + **core**: *array2table, table.Properties.VariableNames*
2. [Export Table or Mat](table/ff_sup_savemat_prep.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/table/ff_sup_savemat_prep.m) \|  html \| pdf |
    + *call*: ff_sup_save_prep(st_path_folder, st_file_name, bl_exp_csv, mt_data, ar_st_colnames); *dependency*: ff_mat2tab
    + **core**: *mkdir, csvwrite, save*


# Matlab Functionalities

1. [Matlab Function with Different Default Parameters](support/funcdefine/ff_varargin.m)
  + **core**: *function [out_put] = func_name(varargin), cell2mat*
2. [Matlab Map with Any Value Types](support/dtype/map.m)
  + **core**: *containers.Map('KeyType','char', 'ValueType','any')*
