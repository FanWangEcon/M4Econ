%% Tables Order, Sort, Add, Rename and Drop Columns
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Given Table, Show Some Columns First

% Generate Table
it_num_cols = 4;
it_num_rows = 5;
mt_data = rand([it_num_rows, it_num_cols]);
tb_test = array2table(mt_data);
cl_col_names = strcat('col_', string((1:it_num_cols)));
cl_row_names = strcat('row_', string((1:it_num_rows)));
tb_test.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_test.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

rng(123);
mean = strcat('data=', string(rand([it_num_rows,1])));
sd = strcat('data=', string(rand([it_num_rows,1])));
tb_test_ori = addvars(tb_test, mean, sd);

% Move Variable
tb_test_varmove = movevars(tb_test_ori, {'mean', 'sd'}, 'Before', 'col_1');

% Display
disp(tb_test_ori);
disp(tb_test_varmove);
%% Rename Table Columns
% Rename the first Column, rename the 'sd' column, then rename the 3rd and 4th 
% Columns. Note for multiple column renaming, use parenthesis, but for single 
% column renaming, use bracket.

tb_test_varmove.Properties.VariableNames{1} = 'RenameMean';
tb_test_varmove.Properties.VariableNames{'sd'} = 'RenameSDCol';
tb_test_varmove.Properties.VariableNames([3 4]) = {'3rd' '4th'};
disp(tb_test_varmove);
%% |Remove Table Column|
% |Remove columns from the Table|

tb_test_varmove_drop = removevars(tb_test_varmove, {'3rd', 'col_3'});
disp(tb_test_varmove_drop);