function ff_defaultmap(varargin)
% @examples
% https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html

params_len = length(varargin);
if params_len > 2
    error('ff_defaultmap:Can only have 2 container map parameters');
end

% Defaults
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('fl_b_bd') = -3;
param_map('fl_kp_min') = 0;
param_map('fl_w_max') = 50;
param_map('it_kb_j') = 100;
param_map('it_w_i') = 100;

support_map = containers.Map('KeyType','char', 'ValueType','any');
support_map('bl_display') = false;
support_map('bl_graph') = false;

default_maps = {param_map, support_map};

% Parse Parameters
% see: C:\Users\fan\M4Econ\support\dtype\map_override.m
[default_maps{1:params_len}] = varargin{:};
param_map = [param_map; default_maps{1}];
support_map = [support_map; default_maps{2}];

% Display
param_map.keys
param_map.values

support_map.keys
support_map.values

end
