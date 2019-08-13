%% Generate Matlab Sample Example Tables
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Generate A Table with Two Variables
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

%% Generate A Table with M Variables
% Generate a numeric table with random varlues and a string column

% Numeric Matrix
it_num_cols = 4;
it_num_rows = 5;
mt_data = rand([it_num_rows, it_num_cols]);

% Generate Table
tb_test = array2table(mt_data);

% Generate Row and Column Names
cl_col_names = strcat('col_', string((1:it_num_cols)));
cl_row_names = strcat('row_', string((1:it_num_rows)));

tb_test.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_test.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

% Generate two string variable
cl_st_var1 = strcat('data=', string(rand([it_num_rows,1])));
cl_st_var2 = strcat('data=', string(rand([it_num_rows,1])));
tb_test = addvars(tb_test, cl_st_var1, cl_st_var2);

% Display Table
disp(tb_test);
