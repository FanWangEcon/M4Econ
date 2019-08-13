%% Table: Add Row and Column names to Table and Strings in Table based on Arrays
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab Codes>
% Table of Content.*

%% Generate Table with Row and Column Names based on Multiple Numeric Array
% Two numeric arrays describe the column names, combine numeric arrays
% together to form string array which becomes table variable/column names.

close all;

% Generate Table 1
ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_fl_abc2 = [0.4 0.1 0.2 0.3 0.4];
number1 = '123';
number2 = '456';
mt_data_a = [ar_fl_abc1' ar_fl_abc2'];

tb_test_a = array2table(mt_data_a);
cl_col_names_a = {['col' num2str(number1)], ['col' num2str(number2)]};
cl_row_names_a = strcat('rowA=', string((1:size(mt_data_a,1))));

tb_test_a.Properties.VariableNames = cl_col_names_a;
tb_test_a.Properties.RowNames = cl_row_names_a;
disp(tb_test_a);

%% Include Row Names as a Variable

% a and b must have the same row names
varrownames = tb_test_a.Properties.RowNames;
tb_test_a = addvars(tb_test_a, varrownames, 'Before', 1);

disp(tb_test_a);
