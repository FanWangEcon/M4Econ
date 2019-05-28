tb_exe_times = array2table([ar_fl_exe_times', ar_fl_exe_times'*it_z*it_iter]);
tb_exe_times.Properties.RowNames = ar_fl_exe_desc;
tb_exe_times.Properties.VariableNames = {'speedmat', 'speedfull'};
disp(tb_exe_times);


% Generate Table From Two Arrays with Row Labels
ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_fl_abc2 = [0.4 0.1 0.2 0.3 0.4];
number1 = '123';
number2 = '456';
mt_data = [ar_fl_abc1' ar_fl_abc2'];

tb_test = array2table(mt_data);
cl_col_names = {['col' num2str(number1)], ['col' num2str(number2)]};
cl_row_names = strcat('row=', string((1:size(mt_data,1))));

tb_test.Properties.VariableNames = cl_col_names;
tb_test.Properties.RowNames = cl_row_names;
disp(tb_test);


% Generate Table From Two Arrays and One Matrix
tb_valpol_iter = array2table([ar_val_diff_norm(1:it_display_every:it_iter)';...
                              ar_pol_diff_norm(1:it_display_every:it_iter)'; ...
                              ar_pol_perc_change(1:it_display_every:it_iter, :)']');
cl_col_names = ['valgap', 'polgap', strcat('z', string((1:size(mt_val_cur,2))))];
cl_row_names = strcat('iter=', string((1:it_display_every:it_iter)));
tb_valpol_iter.Properties.VariableNames = cl_col_names;
tb_valpol_iter.Properties.RowNames = cl_row_names;
tb_valpol_iter.Properties.VariableDescriptions{'valgap'} = 'norm(mt_val - mt_val_cur)';
tb_valpol_iter.Properties.VariableDescriptions{'valgap'} = 'norm(mt_pol_a - mt_pol_a_cur)';
tb_valpol_iter.Properties.VariableDescriptions{'z1'} = 'z1 perc change: sum((mt_pol_a ~= mt_pol_a_cur))/(it_a_n)';
disp(summary(tb_valpol_iter));
disp(tb_valpol_iter);


% table with makevalidname
tb_val = array2table(mt_val_print);
tb_val.Properties.RowNames = strcat('a',string(ar_it_rows), '=', string(ar_a(ar_it_rows)));
tb_val.Properties.VariableNames = matlab.lang.makeValidName(strcat('z=', string(ar_z(ar_it_cols))));
disp('tb_val');
summary(tb_val);
disp(tb_val);
