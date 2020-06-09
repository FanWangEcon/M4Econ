%% All Possible Combinations of Multiple Arrays
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Given Several Arrays of Possibly different Length in Container, all Possible combinations

param_tstar_map = containers.Map('KeyType','char', 'ValueType','any');
param_tstar_map('a') = linspace(1, 5, 5);
param_tstar_map('b') = linspace(0.87, 0.97, 6);
param_tstar_map('c') = linspace(0, 0.5, 10);

cl_st_param_keys = {'a','c'};
cl_ar_param_subset_values = values(param_tstar_map, {'a','c'});

cl_mt_all = cl_ar_param_subset_values;
[cl_mt_all{:}] = ndgrid(cl_ar_param_subset_values{:});
mt_param_vals_combi = cell2mat(cellfun(@(m) m(:), cl_mt_all, 'uni', 0));

tb_all_combi = array2table(mt_param_vals_combi, 'VariableNames', cl_st_param_keys);

disp(tb_all_combi);