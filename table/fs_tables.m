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
