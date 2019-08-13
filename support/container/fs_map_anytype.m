%% Container Map: Genereate Container Maps
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab Codes>
% Table of Content.*

%% Generate a Container map with any time of data
% Create a container map with float, int, string, and matrix

close all;
clear all;

% Create A Map with String Keys and any values
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('share_unbanked_j') = 12;
param_map('equi_r_j') = 2;
param_map('equi_w_j') = 'abc';
param_map('equi_P_j') = zeros(2,3);
param_map.keys
param_map.values

%% Access Multiple Values of a container map
% Values been accessed need to be of the same type

% Parameter Dealing from Map
params_group = values(param_map, {'share_unbanked_j', 'equi_r_j'});
[equi_P_j, equi_r_j] = params_group{:}

% Access Scalar Elements of Map and Convert the Array
cell2mat(values(param_map, {'share_unbanked_j', 'equi_r_j'}))
