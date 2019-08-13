clear all
% There is one map with values, Container Map A. 
% There is another container Map, Container Map B. 
% Container Maps A and B share keys. 
% For keys that exist in B and A, B Key value supercede values for the same keys in A. 
% For new keys in B, they superced keys in A. 

param_map_a = containers.Map('KeyType','char', 'ValueType','any');
param_map_a('fl_b_bd') = -3;
param_map_a('fl_w_max') = 50;
param_map_a('fl_kp_min') = 0;
param_map_a('it_w_i') = 100;

param_map_b = containers.Map('KeyType','char', 'ValueType','any');
param_map_b('fl_w_max') = 77;
param_map_b('fl_kp_min') = -231;
param_map_b('it_z_n') = 5;
param_map_b('fl_z_mu') = 0;

param_map_c = [param_map_a; param_map_b];
param_map_c.keys
param_map_c.values