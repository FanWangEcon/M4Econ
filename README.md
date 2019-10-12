[![HitCount](http://hits.dwyl.io/fanwangecon/M4Econ.svg)](https://github.com/FanWangEcon/M4Econ)  [![Star](https://img.shields.io/github/stars/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/stargazers) [![Fork](https://img.shields.io/github/forks/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/network/members) [![Star](https://img.shields.io/github/watchers/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/watchers)

This is a work-in-progress [website](https://fanwangecon.github.io/M4Econ/) of support files for using matlab, produced by [Fan](https://fanwangecon.github.io/). Materials gathered from various [projects](https://fanwangecon.github.io/research) in which matlab codes are used. Matlab files are linked below by section with livescript files. Tested with [Matlab 2019a](https://www.mathworks.com/company/newsroom/mathworks-announces-release-2019a-of-matlab-and-simulink.html).

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

[![](https://img.shields.io/github/last-commit/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/commits/master) [![](https://img.shields.io/github/commit-activity/m/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/graphs/commit-activity) [![](https://img.shields.io/github/issues/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/issues) [![](https://img.shields.io/github/issues-pr/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/pulls)

<!-- 1. [Linspace + Logspace Asset Grid](asset/grid/ff_grid_loglin.html): [**mlx**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.mlx) \| [**M**](https://github.com/FanWangEcon/R4Econ/blob/master/asset/grid/ff_grid_loglin.m) \|  [**html**](asset/grid/ff_grid_loglin.html) \| [**pdf**](asset/grid/ff_grid_loglin.pdf) -->

# 1. Arrays, Cells and Maps

## 1.1 Numeric Array Manipulations

1. [Accumarray Examples](https://fanwangecon.github.io/M4Econ/support/array/fs_accumarray.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_accumarray_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_accumarray.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_accumarray.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_accumarray.html)
    - eps graphs are essential for clear images in pdf
    - eps = vector graphics, avoid bitmap (jpg, png), use vector graphics
    - **m**: *unique, reshape, accumarray*
2. [Array Broadcasting Examples](https://fanwangecon.github.io/M4Econ/support/array/fs_broadcast_expand.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_broadcast_expand_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_broadcast_expand.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_broadcast_expand.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_broadcast_expand.html)
    - broadcast means: array + array' + matrix = matrix
3. [Array Permutation](https://fanwangecon.github.io/M4Econ/support/array/fs_combi_permu.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_combi_permu_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_combi_permu.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_combi_permu.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_combi_permu.html)
    - all permutations of arrays
    - **m**: *ndgrid, cell2mat(cellfun(@(m) m(:), cl_mt_all, 'uni', 0))*
4. [Imaginary Elements of Array](https://fanwangecon.github.io/M4Econ/support/array/fs_img.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_img_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_img.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_img.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_img.html)
    - find imaginary elements of array
    - **m**: *imag*
5. [Array Reshaping](https://fanwangecon.github.io/M4Econ/support/array/fs_reshape.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_reshape_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_reshape.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_reshape.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_reshape.html)
    - reshape and flatten arrays
    - **m**: *reshape*
6. [Array Subset Slicing](https://fanwangecon.github.io/M4Econ/support/array/fs_slicing.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_slicing_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_slicing.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/array/fs_slicing.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/array/fs_slicing.html)
    - anonymous function to slice array subsets
    - **m**: *f_subset = @(it_subset_n, it_ar_n) unique(round(((0:1:(it_subset_n-1))/(it_subset_n-1)) times (it_ar_n-1)+1));*

## 1.2 Cell Array Manipulations

1. [List Comprehension with Cells](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellfuns.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellfuns_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellfuns.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellfuns.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellfuns.html)
    - cell2mat, cellfun, anonymous function list comprehension over cells
    - find min and max of all arrays in cells; find length of all arrays in cells; find index of elements of one array in another cell array
    - **m**: *cell2mat, cellfun, cell2mat(cellfun(@(m) find(strcmp(ls_st_param_key, m)), cl_st_param_keys, 'UniformOutput', false))*
2. [Permutate Cells](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellscombinations.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombinations_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombinations.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombinations.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellscombinations.html)
    - generate all possible combinations of various arrays contained in cell array
    - **m**: *ndgrid, cell2mat, array2table, cell2mat(cellfun(@(m) m(:), cl_mt_all, 'uni', 0))*
3. [Combine Cells](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellscombine.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombine_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombine.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellscombine.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellscombine.html)
    - combine string cell arrays and string
    - **m**: *[{st_param}, ls_st_param_key, cl_st_param_keys]*
4. [Cells Nested in Cells](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellsnested.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellsnested_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellsnested.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/cells/fs_cellsnested.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/cells/fs_cellsnested.html)
    - Cell of cells with inner cell having multiple types
    - **m**: *cell([4,1]); clns_parm_tstar{1} = {'fl_crra', 'CRRA', linspace(1, 2, it_simu_vec_len)}; disp(clns_parm_tstar(1)); disp(clns_parm_tstar{1}{1});*

## 1.3 String Array Manipulations

1. [String Basics](https://fanwangecon.github.io/M4Econ/support/string/fs_string.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/string/fs_string.html)
    - cut string suffix and append new suffix
    - **m**: *str_sub = split(string, "."); str_sub = strcat(str_sub{1}, '_m.m')*
2. [String Arrays](https://fanwangecon.github.io/M4Econ/support/string/fs_string_array.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_array_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_array.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_array.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/string/fs_string_array.html)
    - concatenate string arrays, string with string,
    - string with numeric arrays, numeric arrays together as strings, combine numeric arrays and append string
    - find string in string cell array
    - print display numerics as strings
    - **m**: *repmat, num2str, strcat, strjoin, fprintf, strcmp, strrep, cel2mat(cellfun(@(m) find(strcmp())))*
3. [String Concatenations](https://fanwangecon.github.io/M4Econ/support/string/fs_string_strcat.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_strcat_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_strcat.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/string/fs_string_strcat.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/string/fs_string_strcat.html)
    - concatenate multiple numeric arrays together with strings and format
    - **m**: *cellstr, strcat*

## 1.4 Container Map Management

1. [List Comprehension with Cells](https://fanwangecon.github.io/M4Econ/support/container/fs_container.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_container_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_container.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_container.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/container/fs_container.html)
    - numeric container map
    - dynamically filled container map
    - **m**: *isKey, containers.Map('KeyType', 'char', 'ValueType','any'), strjoin*
2. [Print Container Map Keys and Values](https://fanwangecon.github.io/M4Econ/support/container/fs_containermap.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_containermap_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_containermap.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_containermap.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/container/fs_containermap.html)
    - loop over map, display keys and values
    - **m**: *strjoin, keys(map), values(map)*
3. [Container Map Varied Value Types](https://fanwangecon.github.io/M4Econ/support/container/fs_map_anytype.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_anytype_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_anytype.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_anytype.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/container/fs_map_anytype.html)
    - numeric scalar, string, matrix as values for map container
    - get values for multiple keys in map
    - **m**: *map.keys, map.values, params_group = values(param_map, {'share_unbanked_j', 'equi_r_j'})*
4. [Cell Override](https://fanwangecon.github.io/M4Econ/support/container/fs_map_override.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_override_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_override.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/container/fs_map_override.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/support/container/fs_map_override.html)
    - Override default map with externally fed map, update existing and add new keys
    - **m**: *param_map_updated = [param_map_old; param_map_updates_new]*

# 2. Matlab Programming Practices

## 2.1 Default Parameters

Default parameters allow for maintaining code testability. The varargin structure could lead to excessive code lines. Container Map works well.

1. [Multi-type Varargin Structure](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_varargin.m)
    - use for functions with limited parameters
    - **m**: *function [out_put] = func_name(varargin), cell2mat*
2. [Container Map Structure](https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html): ipynb \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap_test.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/support/funcdefine/ff_defaultmap_test.pdf)
    - core model functions with potentially many parameters, preferred
    - **m**: *function [out_put] = func_name(varargin); cm_defaults = {cm_a, cm_b}; [cm_defaults{1:optional_params_len}] = varargin{:}; cm_c = [cm_a;cm_b]*

# 3. Graphs and Tables

## 3.1 Basics

1. [Save Images as EPS](https://fanwangecon.github.io/M4Econ/graph/export/fs_eps.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/fs_eps_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/fs_eps.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/fs_eps.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/export/fs_eps.html)
    - eps graphs are essential for clear images in pdf
    - eps = vector graphics, avoid bitmap (jpg, png), use vector graphics
    - **m**: *figure('Renderer', 'Painters')*
2. [Image Pick Colors](https://fanwangecon.github.io/M4Econ/graph/tools/fs_color.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_color_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_color.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_color.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/fs_color.html)
    - display safe colors
    - **m**: *blue = [57 106 177]./255, fill(x, y, cl_colors{it_color});*
3. [Figure Titling and Legend](https://fanwangecon.github.io/M4Econ/graph/tools/fs_titling.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/fs_titling.html)
    - multi-line titles, add legend lines
    - add to legend, select legend to show
    - **m**: *title({'Cash-on-Hand' '$\alpha + \beta = \zeta$'},'Interpreter','latex'); legend([g1, g2, g3], {'near','linear','spline'}, 'Location','best', 'NumColumns',1,'FontSize',12,'TextColor','black');*
4. [Graph Many Lines Legend for Subset](https://fanwangecon.github.io/M4Econ/graph/tools/fs_titling.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/fs_titling.html)
    - state-space plots with color spectrum
    - can not show all states in legend, show subset
    - add additional line to plot and legend
    - **m**: *clr = jet(numel(chart)), set(chart(m),'Color',clr(m,:)); legend2plot = fliplr([1 round(numel(chart)/3) round((2*numel(chart))/4)  numel(chart)]);*

## 3.2 Graph Examples

1. [Scatter Plot](https://fanwangecon.github.io/M4Econ/graph/main/fs_scatter.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_scatter_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_scatter.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_scatter.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/main/fs_scatter.html)
    - scatter multiple lines different colors, shapes and sizes
    - **m**: *scatter, Marker, MarkerEdgeColor, MarkerEdgeAlpha, MarkerFaceColor, MarkerFaceAlpha; scatter(x, y, size)*
2. [Line + Line Plot](https://fanwangecon.github.io/M4Econ/graph/main/fs_lines.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_lines_m.m) \| [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_lines.mlx) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_lines.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/main/fs_lines.html)
    - scatter and lines multiple lines different colors, shapes and sizes
    - **m**: *xline(0), yline(0), refline([1 0]); plot(x,y), HandleVisibility, Color, LineStyle, LineWidth*

## 3.3 Graph Programs

1. [3 Var Line Color, 2D-X 2D-Y and 1D-Color](https://fanwangecon.github.io/M4Econ/graph/basic/plot2dcolorlines.html): [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/basic/plot2dcolorlines.ipynb) \| mlx \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/basic/plot2dcolorlines.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/graph/basic/plot2dcolorlines.html) \| pdf
    - 2d matrix for x and y, column vector value for color spectrum
    - **m**: *plot(2d, 2d) + jet + set(chart(m), 'Color', clr)*
2. [Z(X,Y): Z = y-axis, X = x-axis, Y = color](https://fanwangecon.github.io/M4Econ/graph/html/fsi_graph_grid.html): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/fsi_graph_grid.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/graph/html/fsi_graph_grid.html) \| pdf
    - 3 dimensional graph on 2D with, scatter and line joint
    - **m**: *scatter + plot + (HandleVisibility, linspecer Color)*

## 3.4 Tables

1. [Add Columns to Table](https://fanwangecon.github.io/M4Econ/table/ff_mat2tab.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/M4Econ/blob/master/table/ff_mat2tab.m) \|  html \| pdf
    + *call*: ff_mat2tab(mt_data, ar_st_colnames)
    + **core**: *array2table, table.Properties.VariableNames*
2. [Export Table or Mat](https://fanwangecon.github.io/M4Econ/table/ff_sup_save_prep.m): ipynb \| mlx \| [**M**](https://github.com/FanWangEcon/M4Econ/blob/master/table/ff_sup_save_prep.m) \|  html \| pdf
    + *call*: ff_sup_save_prep(st_path_folder, st_file_name, bl_exp_csv, mt_data, ar_st_colnames); *dependency*: ff_mat2tab
    + **core**: *mkdir, csvwrite, save*

# 4 Speed Improvements

## 4.1 Interpolation

1. [Rational Exponent: Interpolation over Utility of Consumption](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_main.html): u(c) where u evaluation involves rational exponentiation, pre-calculate and interpolate
    - Interpolate function testing: [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_main.ipynb) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_main.html)
    - Interpolate function (griddedInterpolant): [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/ff_rational_exp_interp.m) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/html/ff_rational_exp_interp.html)
    - Direct evaluation and interpolate speed comparison:  [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_test.m) \| [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/exponentiation/fs_rational_exp_interp_test.ipynb) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/exponentiation/fs_rational_exp_interp_test.html)
        + **core**: *interp1, griddedInterpolant, nearest vs linear vs spline*

## 4.2 Matrix and Index

1. [Cell Array Store u(c) to Avoid Duplicate Computation over Iteration](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_main.html): u(c) across iterations often shares many common values
    - Cell matrix part update function testing: [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_main.ipynb) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_main.html)
    - Cell matrix part update function: [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/ff_u_c_partrepeat.m) \| [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/html/ff_u_c_partrepeat.html)
    - Methods for matrix updating speed comparisons:  [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_test.m) \| [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/partupdate/fs_u_c_partrepeat_test.ipynb) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/partupdate/fs_u_c_partrepeat_test.html)
        + **core**: *cell{}, cl_u_store{i}(ar_it_update,:) = f_u(f_c(ar_coh, ar_kp(ar_it_update), ar_bp(ar_it_update)));*
2. [Matrix Index Value Replace: Negative Consumption Utility](https://fanwangecon.github.io/M4Econ/support/speed/index/fs_subscript.html): [**ipynb**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/fs_subscript.ipynb) \| mlx \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/fs_subscript.m) \|  [**html**](https://fanwangecon.github.io/M4Econ/support/speed/index/fs_subscript.html) \| pdf
    - u(c) when c < 0, quickly replace matrix values by index
    - *functions*: [standard index replace](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/ff_subscript_mat_replace.m), [fast index replace](https://github.com/FanWangEcon/M4Econ/blob/master/support/speed/index/ff_subscript_fan_replace.m)
    - *interp1, griddedInterpolant, nearest vs linear vs spline*


----
Please contact [![](https://img.shields.io/github/followers/fanwangecon?label=FanWangEcon&style=social)](https://github.com/FanWangEcon) [![](https://img.shields.io/twitter/follow/fanwangecon?label=%20&style=social)](https://twitter.com/fanwangecon) for issues or problems.

![RepoSize](https://img.shields.io/github/repo-size/fanwangecon/M4Econ)
![CodeSize](https://img.shields.io/github/languages/code-size/fanwangecon/M4Econ)
![Language](https://img.shields.io/github/languages/top/fanwangecon/M4Econ)
![Release](https://img.shields.io/github/downloads/fanwangecon/M4Econ/total)
![License](https://img.shields.io/github/license/fanwangecon/M4Econ)
