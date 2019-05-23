
clear all
data = rand([10,10])-0.3;
disp(data);

% Logical Index of Less than Zero Values
(data < 0)

% linear Index
find(data<0)'

z = 15;
iter = 50;
fl_replace_val = -61.2456;
it_rown = 300; % 4GB if 1000
it_coln = round(((it_rown-1)*it_rown)/2 + it_rown);
c_min = -1;
c_max = 1;
mt_c = rand([it_rown, it_coln])*(c_max - c_min) + c_min;
mt_c_dup = mt_c;

% ar_fl_exe_times = {};
% ar_fl_exe_desc = {};
it_coll = 0;

% Negative c value
f_neg_c_log_idx = @() (mt_c < 0);
f_pos_c_log_idx = @() (mt_c > 0);
f_neg_c_lin_idx = @() find(mt_c < 0);

fl_exe_time = timeit(f_neg_c_log_idx);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'logical index timer';

fl_exe_time = timeit(f_neg_c_lin_idx);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'linear index timer';

% Negative c value
mt_log_idx = f_neg_c_log_idx();
mt_lin_idx = f_neg_c_lin_idx();
f_set_neg_c_log_idx = @() mt_c(mt_log_idx);
f_set_neg_c_lin_idx = @() mt_c(mt_lin_idx);

fl_exe_time = timeit(f_set_neg_c_log_idx);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'get subset logical index timer';

fl_exe_time = timeit(f_set_neg_c_lin_idx);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'get subset linear index timer';

mt_pos_log_idx = f_pos_c_log_idx();
mt_neg_log_idx = f_neg_c_log_idx();

% Fan Index Replace Method
tic;
mt_c_dup = mt_c_dup.*(~mt_neg_log_idx) + fl_replace_val*(mt_neg_log_idx);
toc;

% Standard Index Replace Method
tic;
mt_c_dup(mt_neg_log_idx) = fl_replace_val;
toc;

% Fan Replace
f_replace_idx_fan = @() ff_subscript_fan_replace(mt_c, mt_neg_log_idx, fl_replace_val);

fl_exe_time = timeit(f_replace_idx_fan);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'matrix fan replace method';

% Standard Replace
f_replace_idx_mat = @() ff_subscript_mat_replace(mt_c, mt_neg_log_idx, fl_replace_val);

fl_exe_time = timeit(f_replace_idx_mat);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'matrix standard replace method';

% Double to Single
mt_c_single = single(mt_c);
mt_neg_log_idx_single = single(mt_neg_log_idx);
fl_replace_val_single = single(fl_replace_val);

% mt_neg_log_idx_single

% Fan Replace
f_replace_idx_fan = @() ff_subscript_fan_replace(mt_c_single, mt_neg_log_idx, fl_replace_val_single);

fl_exe_time = timeit(f_replace_idx_fan);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'matrix fan replace method single';

% Fan Replace Single Matrix converted to Double
f_replace_idx_fan = @() ff_subscript_fan_replace(double(mt_c_single), mt_neg_log_idx, fl_replace_val_single);

fl_exe_time = timeit(f_replace_idx_fan);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'matrix fan replace method double(single)';

% Standard Replace
f_replace_idx_mat = @() ff_subscript_mat_replace(mt_c_single, mt_neg_log_idx, fl_replace_val_single);

fl_exe_time = timeit(f_replace_idx_mat);
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'matrix standard replace method single';

tb_exe_times = array2table([ar_fl_exe_times', ar_fl_exe_times'*z*iter]);
tb_exe_times.Properties.RowNames = ar_fl_exe_desc;
tb_exe_times.Properties.VariableNames = {'speedmat', 'speedfull'};
disp(tb_exe_times);
