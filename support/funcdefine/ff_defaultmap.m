function ff_defaultmap(varargin)
% @examples
% https://fanwangecon.github.io/M4Econ/support/funcdefine/ff_defaultmap_test.html

%% Parameters
params_len = length(varargin);
if params_len > 2
    error('ff_defaultmap:Can only have 2 container map parameters');
end

% Defaults
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('fl_crra') = 1.5;
param_map('c_min') = 0.001;
param_map('c_min_for_util') = 0.001;
param_map('c_gap') = 10^-3;
param_map('c_max') = 60;
param_map('it_rown') = 100;
param_map('st_single_double') = 'double';

support_map = containers.Map('KeyType','char', 'ValueType','any');
support_map('bl_display') = true;
support_map('bl_graph') = true;
support_map('bl_graph_onebyones') = true;
support_map('bl_time') = true;
support_map('bl_profile') = false;
support_map('st_profile_path') = [pwd '/profile'];
default_maps = {param_map, support_map};

% Parse Parameters
% see: C:\Users\fan\M4Econ\support\dtype\map_override.m
[default_maps{1:params_len}] = varargin{:};
param_map = [param_map; default_maps{1}];
support_map = [support_map; default_maps{2}];

params_group = values(param_map, {'fl_crra', 'c_min', 'c_min_for_util', 'c_gap', 'c_max'});
[fl_crra, c_min, c_min_for_util, c_gap, c_max] = params_group{:};
params_group = values(param_map, {'it_rown'});
[it_rown] = params_group{:};
params_group = values(param_map, {'st_single_double'});
[st_single_double] = params_group{:};

% support
params_group = values(support_map, {'bl_display', 'bl_graph', 'bl_graph_onebyones'});
[bl_display, bl_graph, bl_graph_onebyones] = params_group{:};
params_group = values(support_map, {'bl_time', 'bl_profile', 'st_profile_path'});
[bl_time, bl_profile, st_profile_path] = params_group{:};

%% Main Porgram
% Tic toc starts
if (bl_time); tic; end


% Print Parameters
if (bl_display)
    disp(param_map.keys);
    disp(param_map.values);
end

% Profile On
if (bl_profile)
    close all;
    profile off;
    profile on;
end

%% Profiling
if (bl_profile)
    profile off
    profile viewer
    profsave(profile('info'), st_profile_path);
end

if (bl_time); toc; end

end
