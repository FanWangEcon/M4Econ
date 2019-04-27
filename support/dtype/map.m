% Create A Map with String Keys and any values
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('share_unbanked_j') = 12;
param_map('equi_r_j') = 2;
param_map('equi_w_j') = 'abc';
param_map('equi_P_j') = zeros(2,3);
param_map.keys
param_map.values

% Parameter Dealing from Map
params_group = values(param_map, {'equi_P_j', 'equi_r_j'})
[equi_P_j, equi_r_j] = params_group{:}
