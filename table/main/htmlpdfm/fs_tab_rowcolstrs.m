%% Row and Column Names for Table based on Arrays
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Generate Table with Row and Column Names based on Multiple Numeric Array
% Two numeric arrays describe the column names, combine numeric arrays together 
% to form string array which becomes table variable/column names.

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
%% Include Row Names as a a String Cell Variable

% a and b must have the same row names
cl_st_varrownames = tb_test_a.Properties.RowNames;
tb_test_a = addvars(tb_test_a, cl_st_varrownames, 'Before', 1);

disp(tb_test_a);
%% Include Row Names as a String Variable

% a and b must have the same row names
st_varrownames = string(cl_st_varrownames);
tb_test_a = addvars(tb_test_a, st_varrownames, 'Before', 1);
disp(tb_test_a);
%% Remove Row Names
% Remove row names

tb_test_a.Properties.RowNames = {};
disp(tb_test_a);
%% Generate String Based on Row Values and Column Names
% Suppose we are looping over meshed grid of parameter values, want to generate 
% a KEY that is based on three of the parameters, but not the remaining parameter. 
% One strategy is to use the current values of the three parameters, combine them 
% with the string column names, and concatenate together. This generate a string 
% key. 

cl_ar_identifier = cell([size(tb_test_a,1), 1]);
for esti_row_idx=1:size(tb_test_a,1)
    
    % Get the current row, 3rd and 4th columns
    ar_fl_colvals = tb_test_a{esti_row_idx,[3,4]};
    ar_st_colnames = tb_test_a.Properties.VariableNames([3,4]);
    ar_st_colvals = cellfun(@(x) strtrim(x), cellstr(num2str(ar_fl_colvals')), 'UniformOutput', false);
    ar_st_identifier = strcat(ar_st_colnames', '=', ar_st_colvals);
    esti_identifier = strjoin(ar_st_identifier, "#");
    
    % add to cell
    cl_ar_identifier{esti_row_idx} = esti_identifier;
end
% this is a group identifier
ar_st_identifier = string(cl_ar_identifier);
tb_test_a = addvars(tb_test_a, cl_ar_identifier, 'Before', 1);
tb_test_a = addvars(tb_test_a, ar_st_identifier, 'Before', 1);
disp(tb_test_a);