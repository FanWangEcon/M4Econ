%% Container Map: Basics of Container Map
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab Codes>
% Table of Content.*

%% if key is in container

param_map_a = containers.Map('KeyType','char', 'ValueType','any');
param_map_a('fl_b_bd') = -3;
param_map_a('fl_w_max') = 50;
param_map_a('fl_kp_min') = 0;
param_map_a('it_w_i') = 100;

disp(isKey(param_map_a, 'it_w_i'));
disp(isKey(param_map_a, 'it_w_i1'));
