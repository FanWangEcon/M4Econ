
clear all;
it_z = 15;
it_rown = 300; % 4GB if 1000
it_rown_update = floor(it_rown/7); % 1/10 of the rows are updated
ar_it_rows_replace = sort(datasample(1:it_rown, it_rown_update, 'Replace', false));
it_coln = round(((it_rown-1)*it_rown)/2 + it_rown);
it_coln = 3000;
it_iter = 50;
it_coll = 0;
% define Arrays
ar_coh = rand([1,it_coln]);
ar_kp = rand([1,it_rown]);
ar_bp = rand([1,it_rown]);

% ar_it_rows_replace

f_c = @(coh, kp, bp) coh - (kp + bp/(1+0.02))
f_u = @(c) log(c)

mt_u = f_u(f_c(ar_coh, ar_kp', ar_bp'));
mt_u_partial = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));
size(mt_u)
size(mt_u_partial)

mt_u = f_u(f_c(ar_coh, ar_kp', ar_bp'));
mt_u_partial = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));

f_full_mt_eval = @() f_u(f_c(ar_coh, ar_kp', ar_bp'));
f_part_mt_eval = @() f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));

fl_exe_time = timeit(f_full_mt_eval)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'f_u(f_c(ar_coh, ar_kp, ar_bp))';

fl_exe_time = timeit(f_part_mt_eval)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace)))';


ts_c_store = zeros([it_rown, it_coln, it_z]);
tic;
for it_iter_n=1:1:it_iter    
    for it_z_m=1:1:it_z
        mt_u = f_u(f_c(ar_coh, ar_kp', ar_bp'));
    end
end
toc;

% timing the function above store in file in the same folder
f_ff_subset_update_func = @() ff_u_c_partrepeat_func(1, ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_rown, it_coln, it_z);
fl_exe_time = timeit(f_ff_subset_update_func)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'ff_u_c_partrepeat_func(1): mt_u = f_u(f_c())';

ts_c_store = zeros([it_rown, it_coln, it_z]);
tic;
for it_iter_n=1:1:it_iter    
    for it_z_m=1:1:it_z
        if (it_iter_n == 1)
            mt_c = f_c(ar_coh, ar_kp', ar_bp');
            ts_c_store(:,:,it_z_m) = mt_c;
            mt_u = f_u(mt_c);
        else
            ts_c_store(ar_it_rows_replace,:,it_z_m) = f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)');            
            mt_u = f_u(ts_c_store(:,:,it_z_m));
        end
    end
end
toc;

% timing the function above store in file in the same folder
f_ff_subset_update_func = @() ff_u_c_partrepeat_func(2, ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_rown, it_coln, it_z);
fl_exe_time = timeit(f_ff_subset_update_func)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'ff_u_c_partrepeat_func(2): f_u(ts_c_store(:,:,it_z_m))';

ts_u_store = zeros([it_rown, it_coln, it_z]);
tic;
for it_iter_n=1:1:it_iter    
    for it_z_m=1:1:it_z
        if (it_iter_n == 1)
            mt_c = f_c(ar_coh, ar_kp', ar_bp');
            mt_u = f_u(mt_c);
            ts_u_store(:,:,it_z_m) = mt_u;
        else
            ts_u_store(ar_it_rows_replace,:,it_z_m) = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));
            mt_u = ts_u_store(:,:,it_z_m);
        end
    end
end
toc;

% timing the function above store in file in the same folder
f_ff_subset_update_func = @() ff_u_c_partrepeat_func(3, ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_rown, it_coln, it_z);
fl_exe_time = timeit(f_ff_subset_update_func)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'ff_u_c_partrepeat_func(3): mt_u = ts_u_store(:,:,it_z_m);';

tic;
for it_iter_n=1:1:it_iter
    for it_z_m=1:1:it_z
        if (it_iter_n == 1)
            mt_c = f_c(ar_coh, ar_kp', ar_bp');
            mt_u = f_u(mt_c);
            if (rem(it_z_m,3) == 0)
                mt_u_1 = mt_u;
            end
            if (rem(it_z_m,3) == 1)
                mt_u_2 = mt_u;
            end
            if (rem(it_z_m,3) == 2)
                mt_u_3 = mt_u;
            end
        else
            mt_updates = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));
            if (rem(it_z_m,3) == 0)
                mt_u_1(ar_it_rows_replace,:) = mt_updates;
                mt_u = mt_u_1;
            end
            if (rem(it_z_m,3) == 1)
                mt_u_2(ar_it_rows_replace,:) = mt_updates;
                mt_u = mt_u_2;
            end
            if (rem(it_z_m,3) == 2)
                mt_u_3(ar_it_rows_replace,:) = mt_updates;
                mt_u = mt_u_3;
            end
        end
    end
end
toc;

% timing the function above store in file in the same folder
f_ff_subset_update_func = @() ff_u_c_partrepeat_func(4, ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_rown, it_coln, it_z);
fl_exe_time = timeit(f_ff_subset_update_func)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'ff_u_c_partrepeat_func(4): mt_u_1, mt_u_2, mt_u_3;';

tic;
cl_u_store = cell([it_z, 1]);
tic;
for it_iter_n=1:1:it_iter    
    for it_z_m=1:1:it_z
        if (it_iter_n == 1)
            mt_c = f_c(ar_coh, ar_kp', ar_bp');
            mt_u = f_u(mt_c);
            cl_u_store{it_z_m} = mt_u;
        else        
            cl_u_store{it_z_m}(ar_it_rows_replace,:) = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace)', ar_bp(ar_it_rows_replace)'));
            mt_u = cl_u_store{it_z_m};            
        end
    end
end
toc;

% timing the function above store in file in the same folder
f_ff_subset_update_func = @() ff_u_c_partrepeat_func(5, ar_it_rows_replace, ar_coh, ar_kp', ar_bp', f_u, f_c, it_iter, it_rown, it_coln, it_z);
fl_exe_time = timeit(f_ff_subset_update_func)
it_coll = it_coll + 1;
ar_fl_exe_times(it_coll) = fl_exe_time;
ar_fl_exe_desc{it_coll} = 'ff_u_c_partrepeat_func(5): mt_u = cl_u_store{it_z_m}';

tb_exe_times = array2table([ar_fl_exe_times', ar_fl_exe_times'*it_z*it_iter]);
tb_exe_times.Properties.RowNames = ar_fl_exe_desc;
tb_exe_times.Properties.VariableNames = {'speedmat', 'speedfull'};
disp(tb_exe_times);
