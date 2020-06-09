%% List Comprehension with Cells
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Find Index of Elements of String Cells in a larger String Cells
% the function below returns the position of cl_st_param_keys in ls_st_param_key 
% should only include in cl_st_param_keys strings that also exist in ls_st_param_key.

ls_st_param_key = {'fl_crra', 'fl_beta', ...
                   'fl_w', 'fl_r_save', ...
                   'fl_a_max', 'it_z_n', 'it_a_n'};

cl_st_param_keys = {'fl_w', 'fl_beta', 'it_z_n'};

cell2mat(cellfun(@(m) find(strcmp(ls_st_param_key, m)), ...
                 cl_st_param_keys, 'UniformOutput', false))
%% Given Container of Arrays, Find Total Length of All Arrays for Selected Keys

cl_st_param_keys = {'fl_crra', 'fl_beta'};

param_tstar_map = containers.Map('KeyType','char', 'ValueType','any');
it_simu_vec_len = 5;

param_tstar_map('fl_crra') = linspace(1, 2, 5);
param_tstar_map('fl_beta') = linspace(0.94, 0.98, 10);
param_tstar_map('w') = linspace(1.1, 1.4, it_simu_vec_len);
param_tstar_map('r') = linspace(0.01, 0.04, it_simu_vec_len);

ar_it_array_len = cell2mat(cellfun(@(m) length(param_tstar_map(m)), ...
                           cl_st_param_keys, 'UniformOutput', false));

it_total_length = sum(ar_it_array_len);
disp(['ar_it_array_len: ' num2str(ar_it_array_len)])
disp(['it_total_length: ' num2str(it_total_length)])
%% Given Container of Arrays, Find Min and Max of Each and Draw Random N sets

cl_st_param_keys = {'fl_crra', 'fl_beta'};

param_tstar_map = containers.Map('KeyType','char', 'ValueType','any');
it_simu_vec_len = 5;

param_tstar_map('fl_crra') = linspace(1, 2, 5);
param_tstar_map('fl_beta') = linspace(0.94, 0.98, 10);
param_tstar_map('w') = linspace(1.1, 1.4, it_simu_vec_len);
param_tstar_map('r') = linspace(0.01, 0.04, it_simu_vec_len);

rng(123);
it_simu_length = 20;
mt_param_rand = cell2mat(cellfun(@(m) ...
                           rand([it_simu_length,1]).*(max(param_tstar_map(m)) - min(param_tstar_map(m))) ...
                           + min(param_tstar_map(m)), ...
                           cl_st_param_keys, 'UniformOutput', false));

tb_rand_draws = array2table(mt_param_rand, 'VariableNames', cl_st_param_keys);

disp(tb_rand_draws);