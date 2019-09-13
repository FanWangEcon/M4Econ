This is a work-in-progress [website](https://fanwangecon.github.io/M4Econ/) of support files for using matlab, produced by [Fan](https://fanwangecon.github.io/). Materials gathered from various [projects](https://fanwangecon.github.io/research) in which matlab codes are used. Matlab files are linked below by section with livescript files. Tested with [Matlab 2019a](https://www.mathworks.com/company/newsroom/mathworks-announces-release-2019a-of-matlab-and-simulink.html).

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.
<!-- 1. [Linspace + Logspace Asset Grid](asset/grid/ff_grid_loglin.html): [**mlx**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.mlx) \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.m) \|  [**html**](asset/grid/ff_grid_loglin.html) \| [**pdf**](asset/grid/ff_grid_loglin.pdf) -->

# 2. Matlab Programming Practices

## 2.1 Default Parameters

Default parameters allow for maintaining code testability. The varargin structure could lead to excessive code lines. Container Map works well.

1. [Multi-type Varargin Structure](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_varargin.m)
    - use for functions with limited parameters
    - *function [out_put] = func_name(varargin), cell2mat*
2. [Container Map Structure](https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html): ipynb \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap_test.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap_test.pdf)
    - core model functions with potentially many parameters, preferred
    - *function [out_put] = func_name(varargin); cm_defaults = {cm_a, cm_b}; [cm_defaults{1:optional_params_len}] = varargin{:}; cm_c = [cm_a;cm_b]*

## 2.2 Container Maps

Use this structure for carrying parameters and input arrays. By using container maps, if parameters are added to model, code editing is limited to actual location where parameter is used and initial location of definition.

1. [Any Type Container Maps](support/dtype/map_anytype.m):
    - cells, arrays, floats in the same map
    - *containers.Map('KeyType','char', 'ValueType','any')*
2. [Combining Container Maps](support/dtype/map_override.m)
    - container b overrides container a if keys exist in both
    - *cm_c = [cm_a;cm_b]*

# 3. Graphs and Tables

## 3.1 Basic Graphing

1. [3 Var Line Color, 2D-X 2D-Y and 1D-Color](https://fanwangecon.github.io/M4Econ/graph/basic/plot2dcolorlines.html): [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/basic/plot2dcolorlines.ipynb) \| mlx \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/basic/plot2dcolorlines.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/graph/basic/plot2dcolorlines.html) \| pdf
    - 2d matrix for x and y, column vector value for color spectrum
    - *plot(2d, 2d) + jet + set(chart(m), 'Color', clr)*

## 3.2 Main Graphing

1. [Z(X,Y): Z = y-axis, X = x-axis, Y = color](https://fanwangecon.github.io/M4Econ/graph/html/fsi_graph_grid.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/fsi_graph_grid.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/graph/html/fsi_graph_grid.html) \| pdf
    - 3 dimensional graph on 2D with, scatter and line joint
    - *scatter + plot + (HandleVisibility, linspecer Color)*

## 3.3 Basic Tables

1. [Add Columns to Table](https://fanwangecon.github.io/M4Econ/table/ff_mat2tab.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/M4Econ/blob/master/table/ff_mat2tab.m) \|  html \| pdf
    + *call*: ff_mat2tab(mt_data, ar_st_colnames)
    + **core**: *array2table, table.Properties.VariableNames*
2. [Export Table or Mat](https://fanwangecon.github.io/M4Econ/table/ff_sup_save_prep.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/M4Econ/blob/master/table/ff_sup_save_prep.m) \|  html \| pdf
    + *call*: ff_sup_save_prep(st_path_folder, st_file_name, bl_exp_csv, mt_data, ar_st_colnames); *dependency*: ff_mat2tab
    + **core**: *mkdir, csvwrite, save*

# 1 Speed Improvements

## 1.1 Interpolation

1. [Rational Exponent: Interpolation over Utility of Consumption](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_main.html): u(c) where u evaluation involves rational exponentiation, pre-calculate and interpolate
    - Interpolate function testing: [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_main.ipynb) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_main.html)
    - Interpolate function (griddedInterpolant): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/ff_rational_exp_interp.m) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/html/ff_rational_exp_interp.html)
    - Direct evaluation and interpolate speed comparison:  [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_test.m) \| [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_test.ipynb) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_test.html)
        + **core**: *interp1, griddedInterpolant, nearest vs linear vs spline*

## 1.2 Matrix and Index

1. [Cell Array Store u(c) to Avoid Duplicate Computation over Iteration](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_main.html): u(c) across iterations often shares many common values
    - Cell matrix part update function testing: [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_main.ipynb) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_main.html)
    - Cell matrix part update function: [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/ff_u_c_partrepeat.m) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/html/ff_u_c_partrepeat.html)
    - Methods for matrix updating speed comparisons:  [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_test.m) \| [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_test.ipynb) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_test.html)
        + **core**: *cell{}, cl_u_store{i}(ar_it_update,:) = f_u(f_c(ar_coh, ar_kp(ar_it_update), ar_bp(ar_it_update)));*
2. [Matrix Index Value Replace: Negative Consumption Utility](https://fanwangecon.github.io/M4Econ/support/speed/index/fs_subscript.html): [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/fs_subscript.ipynb) \| mlx \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/fs_subscript.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/index/fs_subscript.html) \| pdf
    - u(c) when c < 0, quickly replace matrix values by index
    - *functions*: [standard index replace](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/ff_subscript_mat_replace.m), [fast index replace](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/ff_subscript_fan_replace.m)
    - *interp1, griddedInterpolant, nearest vs linear vs spline*

# 4. Additional Programs

## 4.1 Discretization

1. [Linspace + Logspace Asset Grid](https://fanwangecon.github.io/M4Econ/asset/grid/ff_grid_loglin.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/M4Econ/blob/master/asset/grid/ff_grid_loglin.m) \|  html \| pdf
    + *call*: ff_grid_loglin(it_a_vec_n, fl_amax, fl_amin, fl_loglin_threshold)
    + **core**: *while + logspace + start:gap:fin + unique*
