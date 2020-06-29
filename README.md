[![HitCount](http://hits.dwyl.io/fanwangecon/M4Econ.svg)](https://github.com/FanWangEcon/M4Econ)  [![Star](https://img.shields.io/github/stars/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/stargazers) [![Fork](https://img.shields.io/github/forks/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/network/members) [![Star](https://img.shields.io/github/watchers/fanwangecon/M4Econ?style=social)](https://github.com/FanWangEcon/M4Econ/watchers)

This is a work-in-progress [website](https://fanwangecon.github.io/M4Econ/) consisting of Matlab example code for manipulating various data structures, dynamic programming, graphing and associated tasks.

> [**bookdown site**](https://fanwangecon.github.io/M4Econ/bookdown) and [**bookdown pdf**](https://fanwangecon.github.io/M4Econ/bookdown/Data-Structures-and-Dynamic-Optimization-with-Matlab.pdf).

Materials gathered from various [projects](https://fanwangecon.github.io/research) in which matlab is used. Matlab files are linked below by section with livescript files. Tested with [Matlab](https://www.mathworks.com/products/matlab.html) 2019a. This is not a Matlab package, but a list of examples in PDF/HTML/Mlx formats. [MEconTools](https://fanwangecon.github.io/MEconTools/) is a package that can be installed with tools used in projects involving matlab code.

Bullet points in the Appendix show which matlab functions/commands are used to achieve various objectives. The goal of this repository is to make it easier to find/re-use codes produced for various projects. Some functions also rely on or correspond to functions from [MEconTools](https://github.com/FanWangEcon/MEconTools) [@M-MEconTools].

From other repositories: For dynamic borrowing and savings problems, see [Dynamic Asset Repository](https://fanwangecon.github.io/CodeDynaAsset/); For code examples, see also [R Example Code](https://fanwangecon.github.io/R4Econ/), and [Stata Example Code](https://fanwangecon.github.io/Stata4Econ/); For intro stat with R, see [Intro Statistics for Undergraduates](https://fanwangecon.github.io/Stat4Econ/), and intro Math with Matlab, see [Intro Mathematics for Economists](https://fanwangecon.github.io/Math4Econ/). See [here](https://github.com/FanWangEcon) for all of [Fan](https://fanwangecon.github.io/)'s public repositories.

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

[![](https://img.shields.io/github/last-commit/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/commits/master) [![](https://img.shields.io/github/commit-activity/m/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/graphs/commit-activity) [![](https://img.shields.io/github/issues/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/issues) [![](https://img.shields.io/github/issues-pr/fanwangecon/M4Econ)](https://github.com/FanWangEcon/M4Econ/pulls)

# 1  Data Structures

## 1.1  Matrices and Arrays

1. [Array Reshape, Repeat and Expand](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_reshape.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_reshape.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_reshape.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_reshape.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_reshape.html)
	+ Reshape and flatten arrays.
	+ **m**: *reshape()*
2. [Array Index Slicing and Subsetting to Replace and Expand](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_slicing.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_slicing.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_slicing.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_slicing.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_slicing.html)
	+ Index based column and row expansions.
	+ Anonymous function to slice array subsets.
	+ **m**: *sub2ind() + @(it_subset_n, it_ar_n) unique(round(((0:1:(it_subset_n-1))/(it_subset_n-1)) times (it_ar_n-1)+1))*
3. [3D, 4D, N4 Arrays Reshape and Summarize](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_3d4dndarray.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_3d4dndarray.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_3d4dndarray.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_3d4dndarray.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_3d4dndarray.html)
	+ Slice 2D matrixes out of ND matrixes. The 2D matrix is contiguous, but can be intermediate dimensions.
	+ Summarize a nd dimensional matrix along one or two dimensions group by various other dimensions.
	+ **m**: *permute(mn, [3,1,2,4]) + squeeze(num2cell(mn, [1,2])) + celldisp() + ndgrid()*
4. [Array Broadcasting Examples](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_broadcast_expand.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_broadcast_expand.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_broadcast_expand.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_broadcast_expand.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_broadcast_expand.html)
	+ broadcast means: array + array’ + matrix = matrix.
5. [Grid States, Choices and Optimal Choices Example](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_stateschoicesopti.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_stateschoicesopti.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_stateschoicesopti.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_stateschoicesopti.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_stateschoicesopti.html)
	+ States, choices, and find max.
6. [Accumarray Examples](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_accumarray.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_accumarray.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_accumarray.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_accumarray.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_accumarray.html)
	+ Accumarray to sum up probabilities/values for discrete elements of arrays.
	+ **m**: *unique() + reshape() + accumarray()*
7. [Array Random Draws and Permutation](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_combi_permu.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_combi_permu.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_combi_permu.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_combi_permu.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_combi_permu.html)
	+ Draw randomly from array, permutate arrays.
	+ **m**: *ndgrid() + cell2mat(cellfun(@(m) m(:), cl_mt_all, 'uni', 0))*
8. [Imaginary Elements of Array](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_img.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/fs_img.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_img.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/array/htmlpdfm/fs_img.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/array/htmlpdfm/fs_img.html)
	+ Find imaginary elements of array.
	+ **m**: *imag()*

## 1.2  Cells

1. [List Comprehension with Cells](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellfuns.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/fs_cellfuns.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellfuns.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellfuns.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellfuns.html)
	+ Cell2mat, cellfun, anonymous function list comprehension over cells.
	+ Find min and max of all arrays in cells.
	+ Find length of all arrays in cells; find index of elements of one array in another cell array.
	+ **m**: *cell2mat() + cellfun() + strcmp() + find() + cell2mat(cellfun(@(m) find(strcmp(ls_st_param_key, m)), cl_st_param_keys, ‘UniformOutput’, false))*
2. [Permutate Cells](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellscombinations.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/fs_cellscombinations.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellscombinations.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellscombinations.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellscombinations.html)
	+ Generate all possible combinations of various arrays contained in cell array.
	+ **m**: *ndgrid() + cell2mat() + array2table() + cell2mat(cellfun(@(m) m(:), cl_mt_all, ‘uni’, 0))*
3. [Combine Cells](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellscombine.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/fs_cellscombine.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellscombine.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellscombine.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellscombine.html)
	+ Combine string cell arrays and string.
	+ **m**: *[{st_param}, ls_st_param_key, cl_st_param_keys]*
4. [Nested Cells](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellsnested.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/fs_cellsnested.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellsnested.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/cell/htmlpdfm/fs_cellsnested.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/cell/htmlpdfm/fs_cellsnested.html)
	+ Cell of cells with inner cell having multiple types.
	+ **m**: *linspace() + cell([4,1]) + clns_parm_tstar{1} = {‘fl_crra’, ‘CRRA’, linspace(1, 2, it_simu_vec_len)} + disp(clns_parm_tstar(1)) + disp(clns_parm_tstar{1}{1})*

## 1.3  Characters and Strings

1. [String Basics](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/fs_string.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string.html)
	+ Compose string and rounded numeric array.
	+ Cut string suffix and append new suffix.
	+ **m**: *compose() + strjoin() + str_sub = split(string, ".") + strcat(str_sub{1}, '_m.m')*
2. [String Arrays Operations](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string_array.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/fs_string_array.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string_array.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string_array.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string_array.html)
	+ String arrays and cell strings.
	+ Duplicate strings, concatenate string, and paste strings jointly with separator.
	+ Find string element positions, replace substrings.
	+ **m**: *repmat() + num2str() + strcat() + strjoin() + fprintf() + strcmp() + strrep() + cel2mat(cellfun(@(m) find(strcmp())))*
3. [String and Numeric Array Concatenations](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string_strcat.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/fs_string_strcat.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string_strcat.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/string/htmlpdfm/fs_string_strcat.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/string/htmlpdfm/fs_string_strcat.html)
	+ Generate rounded string array matrix with leading zero, leading space, decimal round from numeric matrix.
	+ Create a title string by joining rounded parameter and parameter names.
	+ Concatenate multiple numeric arrays together with strings and format.
	+ **m**: *compose() + cellstr() + strcat() + strjoin() + %.2f*

## 1.4  Map Containers

1. [Container Map Basics](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_container.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/fs_container.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_container.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_container.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_container.html)
	+ Numeric container map, dynamically filled container map.
	+ **m**: *isKey() + strjoin() + containers.Map('KeyType', 'char', 'ValueType', 'any')*
2. [Display Container Map Keys and Values](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_containermap.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/fs_containermap.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_containermap.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_containermap.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_containermap.html)
	+ Loop over map, display keys and values.
	+ **m**: *strjoin() + keys(map) + values(map)*
3. [Container Map Varied Value Type](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_map_anytype.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/fs_map_anytype.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_map_anytype.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_map_anytype.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_map_anytype.html)
	+ Numeric scalar, string, matrix as values for map container.
	+ Get values for multiple keys in map.
	+ **m**: *map.keys() + map.values() + values(param_map, {'share_unbanked_j', 'equi_r_j'})*
4. [Cell Override](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_map_override.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/fs_map_override.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_map_override.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/amto/container/htmlpdfm/fs_map_override.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/amto/container/htmlpdfm/fs_map_override.html)
	+ Override default map with externally fed map, update existing and add new keys.
	+ **m**: *param_map_updated = [param_map_old; param_map_updates_new]*

# 2  Functions

## 2.1  varargin Default Parameters

1. [Use varargin as a Function Parameter](https://fanwangecon.github.io/M4Econ/function/defaultparam/htmlpdfm/fs_varargin.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/fs_varargin.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/htmlpdfm/fs_varargin.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/htmlpdfm/fs_varargin.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/function/defaultparam/htmlpdfm/fs_varargin.html)
	+ Default parameters allow for maintaining code testability.
	+ Use varargin for functions with limited parameters.
	+ **m**: *varargin + cell2mat() + function [out_put] = func_name(varargin)*
2. [Use varargin as a Function Parameter](https://fanwangecon.github.io/M4Econ/function/defaultparam/htmlpdfm/fs_defaultmap.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/fs_defaultmap.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/htmlpdfm/fs_defaultmap.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/function/defaultparam/htmlpdfm/fs_defaultmap.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/function/defaultparam/htmlpdfm/fs_defaultmap.html)
	+ The varargin structure could lead to excessive code lines. Container Map works well with large parameter structure.
	+ Core model functions with potentially many parameters, possibly override default generation to save time.
	+ **m**: *varargin + function [out_put] = func_name(varargin) + cm_defaults = {cm_a, cm_b} + [cm_defaults{1:optional_params_len}] = varargin{:} + cm_c = [cm_a;cm_b]*

# 3  Graphs

## 3.1  Figure Components

1. [Image Pick Safe Colors](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_color.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_color.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_color.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_color.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_color.html)
	+ Display safe colors.
	+ **m**: *blue = [57 106 177]./255 + fill(x, y, cl_colors{it_color})*
2. [Figure Titling and Legend](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_titling.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_titling.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_titling.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_titling.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_titling.html)
	+ Multi-line titles, add legend lines.
	+ Add to legend, select legend to show.
	+ **m**: *title({'Cash-on-Hand' '$\alpha + \beta = \zeta$'},'Interpreter','latex') + legend([g1, g2, g3], {'near','linear','spline'}, 'Location', 'best', 'NumColumns', 1, 'FontSize', 12, 'TextColor', 'black');*
3. [Graph Many Lines Legend for Subset](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_legendsubset.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/fs_legendsubset.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_legendsubset.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/tools/htmlpdfm/fs_legendsubset.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/tools/htmlpdfm/fs_legendsubset.html)
	+ State-space plots with color spectrum: can not show all states in legend, show subset, add additional line to plot and legend.
	+ **m**: *jet() + numel() + fliplr() + jet(numel(chart)), set(chart(m), 'Color', clr(m,:))*

## 3.2  Basic Figure Types

1. [Scatter Plot Examples](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_scatter.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_scatter.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_scatter.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_scatter.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_scatter.html)
	+ Scatter multiple lines different colors, shapes and sizes.
	+ **m**: *scatter(x, y, size) + Marker + MarkerEdgeColor + MarkerEdgeAlpha + MarkerFaceColor + MarkerFaceAlpha*
2. [Scatter Plot Examples](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_lines.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_lines.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_lines.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_lines.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_lines.html)
	+ Scatter and lines multiple lines different colors, shapes and sizes.
	+ X axis, Y axis, and 45 degree line.
	+ **m**: *xline(0) + yline(0) + refline([1 0]) + plot(x,y) + HandleVisibility + Color + LineStyle + LineWidth*
3. [Three variables Scatter and Lines with Color Spectrum](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_specline.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/fs_specline.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_specline.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/main/htmlpdfm/fs_specline.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/main/htmlpdfm/fs_specline.html)
	+ Two dimensional matrix for x and y, a third variable with color spectrum set via loop.
	+ **m**: *plot(2d, 2d) + jet + set(chart(m), 'Color', clr)*

## 3.3  Write and Read Plots

1. [Graph Generate EPS Postscript Figures](https://fanwangecon.github.io/M4Econ/graph/export/htmlpdfm/fs_eps.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/fs_eps.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/htmlpdfm/fs_eps.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/graph/export/htmlpdfm/fs_eps.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/graph/export/htmlpdfm/fs_eps.html)
	+ EPS vector graphics, avoid bitmap (jpg, png), use vector graphics.
	+ **m**: *figure('Renderer', 'Painters')*

# 4  Tables

## 4.1  Basic Table Generation

1. [Named Tables with Random Data](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_gensample.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/fs_tab_gensample.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_gensample.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_gensample.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_gensample.html)
	+ Convert a random matrix to a table with column and row names defined with arrays.
	+ **m**: *array2table() + strcat() + addvars() + matlab.lang.makeValidName()*
2. [Order and Sort Columns](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_ordersort.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/fs_tab_ordersort.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_ordersort.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_ordersort.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_ordersort.html)
	+ Convert a matrix to table with mean and sd columns. Rearrange columns.
	+ **m**: *array2table() + rng() + movevars() + matlab.lang.makeValidName() + tb.Properties.VariableNames + tb.Properties.RowNames*
3. [Array Based Row and Column Names](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_rowcolstrs.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/fs_tab_rowcolstrs.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_rowcolstrs.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/table/main/htmlpdfm/fs_tab_rowcolstrs.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/table/main/htmlpdfm/fs_tab_rowcolstrs.html)
	+ Generate a column and row named table. Convert row names to a column as strings.
	+ **m**: *array2table() + string()         + strcat('rowA=', string((1:size(mt, 1)))) + tb_test_a.Properties.VariableNames + tb_test_a.Properties.RowNames + addvars(tb, rownames, 'Before', 1)*

## 4.2  Table Joining

1. [Stack Matlab Tables](https://fanwangecon.github.io/M4Econ/table/join/htmlpdfm/fs_tab_stack.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/table/join/fs_tab_stack.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/table/join/htmlpdfm/fs_tab_stack.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/table/join/htmlpdfm/fs_tab_stack.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/table/join/htmlpdfm/fs_tab_stack.html)
	+ Append columns to existing table. Stack tables vertically and horizontally.
	+ Simulate a model, column combine simulation parameters with multi-row simulation results. Then row stack results from multiple simulations together.
	+ **m**: *array2table() + [tb_a tb_b] + [tb_a; tb_b] + tb.Properties.VariableNames + tb.Properties.RowNames*

# 5  Panel

## 5.1  Time Series

1. [Autoregressive Process AR(1)](https://fanwangecon.github.io/M4Econ/panel/timeseries/htmlpdfm/fs_autoregressive.html): [**mlx**](https://github.com/FanWangEcon/M4Econ/blob/master/panel/timeseries/fs_autoregressive.mlx) \| [**m**](https://github.com/FanWangEcon/M4Econ/blob/master/panel/timeseries/htmlpdfm/fs_autoregressive.m) \| [**pdf**](https://github.com/FanWangEcon/M4Econ/blob/master/panel/timeseries/htmlpdfm/fs_autoregressive.pdf) \| [**html**](https://fanwangecon.github.io/M4Econ/panel/timeseries/htmlpdfm/fs_autoregressive.html)
	+ The Mean and standard deviation of an AR(1) process.
	+ Simulate and graph an AR(1) persistent process.
	+ **m**: *normrnd() + for it_t=1:1:length(ar_shk) + plot(ar_t, ar_y)*

----
Please contact [![](https://img.shields.io/github/followers/fanwangecon?label=FanWangEcon&style=social)](https://github.com/FanWangEcon) [![](https://img.shields.io/twitter/follow/fanwangecon?label=%20&style=social)](https://twitter.com/fanwangecon) for issues or problems.

![RepoSize](https://img.shields.io/github/repo-size/fanwangecon/M4Econ)
![CodeSize](https://img.shields.io/github/languages/code-size/fanwangecon/M4Econ)
![Language](https://img.shields.io/github/languages/top/fanwangecon/M4Econ)
![Release](https://img.shields.io/github/downloads/fanwangecon/M4Econ/total)
![License](https://img.shields.io/github/license/fanwangecon/M4Econ)

