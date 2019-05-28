%% ff_vf_az solves the one asset one shock asset problem
function [mt_val, mt_pol, flag] = ff_az_vf(varargin)

%% Check Error
params_len = length(varargin);
if params_len > 4
    error('ff_az_vf:Can only have 4 container map parameters');
end

%% Parameters  Defaults
it_param_set = 1;
[param_map, support_map] = ffs_az_set_default_param(it_param_set);
[armt_map, func_map] = ffs_az_get_funcgrid(param_map, support_map, 1); % 1 for override
default_params = {param_map support_map armt_map};

%% Override
% if varargin only has param_map and support_map,
[default_maps{1:params_len}] = varargin{:};
param_map = [param_map; default_maps{1}];
support_map = [support_map; default_maps{2}];
if params_len >= 1 && params_len <= 2
    % If override param_map, re-generate armt and func if they are not
    % provided
    [armt_map, func_map] = ffs_az_get_funcgrid(param_map, support_map, 1);
else
    % Override all
    armt_map = [armt_map; default_params{3}];
    func_map = [func_map; default_params{4}];
end

%% Profiling start
bl_profile = true;
if (bl_profile)
    close all;
    profile off;
    profile on;
end


%% Timing Starts
if (bl_time_vf_okz); tic; end
%% Loop Solution


%% Timing Ends
if (bl_time_vf_okz); toc; end

%% Profiling
if (bl_profile)
    profile off
    profile viewer
    st_profile_file = ['C:/Users/fan/ThaiForInfLuuRobFan/matlab/inf_okz/solve/_profile/vf_okz_interp_p' num2str(it_cm)];
    profsave(profile('info'), st_profile_file);
end

%% Graphing Final
if (bl_graph_vf_okz)
    vf_okz_grh(param_map, support_map, armt_map, mt_val, mt_pol_wkb, mt_pol_kap)
end

%% Save Workspace in Mat File
if (support_map('bl_save_mat_vfi'))
    st_file_name = ['vf_' support_map('st_file_name')];
    save(ff_sup_save_prep(support_map('st_path_folder'), st_file_name));
end


end
