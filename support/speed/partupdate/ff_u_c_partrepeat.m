function ff_u_c_partrepeat(varargin)
% Use Cell array indexing to avoid redoing u(c) computation

%% Parameters
params_len = length(varargin);
if params_len > 2
    error('ff_defaultmap:Can only have 2 container map parameters');
end

% Defaults
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('it_z') = 15;
param_map('it_rown') = 50;
param_map('it_rown_update') = floor(param_map('it_rown')/7);
param_map('it_coln') = round(((param_map('it_rown')-1)*param_map('it_rown'))/2 + param_map('it_rown'));
param_map('it_iter') = 50;

support_map = containers.Map('KeyType','char', 'ValueType','any');
support_map('bl_display') = true;
support_map('bl_time') = true;
support_map('bl_profile') = false;
support_map('st_profile_path') = [pwd '/profile'];
default_maps = {param_map, support_map};

% Parse Parameters
% see: C:\Users\fan\M4Econ\support\dtype\map_override.m
[default_maps{1:params_len}] = varargin{:};
param_map = [param_map; default_maps{1}];
support_map = [support_map; default_maps{2}];

params_group = values(param_map, {'it_z', 'it_rown', 'it_rown_update', 'it_coln', 'it_iter'});
[it_z, it_rown, it_rown_update, it_coln, it_iter] = params_group{:};

% support
params_group = values(support_map, {'bl_display'});
[bl_display] = params_group{:};
params_group = values(support_map, {'bl_time', 'bl_profile', 'st_profile_path'});
[bl_time, bl_profile, st_profile_path] = params_group{:};
% Profile On
if (bl_profile)
    close all;
    profile off;
    profile on;
end
if (bl_time); tic; end
%% Function Core
% Initialize
it_coll = 0;
ar_it_rows_replace = sort(datasample(1:it_rown, it_rown_update, 'Replace', false));

% define Functions
f_c = @(coh, kp, bp) coh - (kp + bp/(1+0.02));
f_u = @(c) log(c);

% define Arrays
ar_coh = rand([1,it_coln]);
ar_kp = rand([1,it_rown]);
ar_bp = rand([1,it_rown]);

% Method Cell Replace
f_ff_subset_update_func = @() ffs_full_replace(ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_z);
fl_exe_time = timeit(f_ff_subset_update_func);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'Recompuate u(c) every time: mt_u = f_u(f_c(coh, k, b))';

f_ff_subset_update_func = @() ffs_cellpart_replace(ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_z);
fl_exe_time = timeit(f_ff_subset_update_func);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'Update u(c) where c changes: store{i}(replace_rows,:) = f_u(f_c(coh, k(replace_rows), b(replace_rows)));';

% Display Resuplts
tb_exe_times = array2table([ar_fl_exe_times', ar_fl_exe_times'*it_z*it_iter]);
tb_exe_times.Properties.RowNames = ar_fl_exe_desc;
tb_exe_times.Properties.VariableNames = {'speedmat', 'speedfull'};

if (bl_display)
    disp(param_map.keys);
    disp(param_map.values);
    disp(tb_exe_times);
end

%% Profiling
if (bl_profile)
    profile off
    profile viewer
    profsave(profile('info'), st_profile_path);
end
if (bl_time); toc; end
end

%% Partial Replace with Cell Indexing
function ffs_cellpart_replace(ar_it_rows_replace, ar_coh, ar_kp, ar_bp, f_u, f_c, it_iter, it_z)
% This is the most efficient method
cl_u_store = cell([it_z, 1]);
tic;
for it_iter_n=1:1:it_iter
    for it_z_m=1:1:it_z
        if (it_iter_n == 1)
            mt_c = f_c(ar_coh, ar_kp, ar_bp);
            mt_u = f_u(mt_c);
            cl_u_store{it_z_m} = mt_u;
        else
            cl_u_store{it_z_m}(ar_it_rows_replace,:) = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace)));
            mt_u = cl_u_store{it_z_m};
        end
    end
end
end

%% Full Replace
function ffs_full_replace(ar_coh, ar_kp, ar_bp, f_u, f_c, it_iter, it_z)
for it_iter_n=1:1:it_iter
    for it_z_m=1:1:it_z
        mt_u = f_u(f_c(ar_coh, ar_kp, ar_bp));
    end
end
end