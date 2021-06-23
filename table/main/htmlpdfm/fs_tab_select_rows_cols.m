%% Select Subset of Rows and Columns
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Generate a Table 

close all;
% Generate Table 1
ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4 1 1.1];
ar_fl_abc2 = [0.4 0.1 0.2 0.3 0.4  2 2.2];
number1 = '123';
number2 = '456';
mt_data_a = [ar_fl_abc1' ar_fl_abc2'];
tb_test_a = array2table(mt_data_a);
cl_col_names_a = {['col' num2str(number1)], ['col' num2str(number2)]};
cl_row_names_a = strcat('rowA=', string((1:size(mt_data_a,1))));
tb_test_a.Properties.VariableNames = cl_col_names_a;
tb_test_a.Properties.RowNames = cl_row_names_a;
% a and b must have the same row names
cl_st_varrownames = tb_test_a.Properties.RowNames;
tb_test_a = addvars(tb_test_a, cl_st_varrownames, 'Before', 1);
% a and b must have the same row names
st_varrownames = string(cl_st_varrownames);
tb_test_a = addvars(tb_test_a, st_varrownames, 'Before', 1);
tb_test_a = addvars(tb_test_a, ["a", "b", "cc", "aa", "b", "z", "zz"]', 'Before', 1);
disp(tb_test_a);
%% Select Rows if ColX is Equal to Something
% Select a subset of rows based on the variable value in one column 

% select the rows where Var1="b"
disp(tb_test_a(strcmp(tb_test_a.Var1, "b"),:));
% select the rows where col123=0.4
disp(tb_test_a(tb_test_a.col123==0.4,:));
%% Select Rows if ColX is Equal to Something or Something else
% Select if the value in Var1 is either the string a or the string b, below, 
% specify these explicitly

% select the rows where Var1="b" or Var1="a"
disp(tb_test_a(strcmp(tb_test_a.Var1, "b") | strcmp(tb_test_a.Var1, "a"),:));
%% 
% Alternatively, use <https://www.mathworks.com/help/matlab/ref/matches.html 
% matches>, to find if the variable is equal to either a or b, the list of potential 
% match is a string array. 

% Using matches
ar_st_potential_matches = ["a", "b"];
disp(tb_test_a(matches(tb_test_a.Var1, ar_st_potential_matches),:));
%% 
% Now match over any a to z letters, picking up any letters a to z if they appear 
% in column Var1. 

% Using matches
ar_st_match_atz = string(('a':'z')')';
disp(tb_test_a(matches(tb_test_a.Var1, ar_st_match_atz),:));
%% Read in a Table from an Excel File
% There are estimates stored in a table. Each row is a different estimation 
% result, with a different set of estimates, for each row some fixed (not-estimated) 
% parameter might vary. Each column represents a different parameter, or the parameter's 
% state (initial value, estimated value, standard error, etc). 
% 
% The estimatetion results file is stored in: M4Econ\table\_exa\excel_exa.xlsx. 
% We want to load in this file. Directory is one root up and one root down. The 
% file has multiple sheets, automatically loads in the first sheet. And print 
% table variables names, column names. 

srn_excel_exa = 'C:\Users\fan\M4Econ\table\_exa\excel_exa.xlsx';
tb_read = readtable(srn_excel_exa);
disp((tb_read.Properties.VariableNames)');
%% Select Table Columns based on Column Name Strings
% Given the table that we loaded in above, select only the columns that start 
% with some string like "gamma", or columns that end with certain strings, like 
% "_esti".
% 
% The <https://www.mathworks.com/help/matlab/ref/startswith.html startsWith>, 
% <https://www.mathworks.com/help/matlab/ref/contains.html contains>, and <https://www.mathworks.com/help/matlab/ref/endswith.html 
% endsWith> are string functions that generate logical arrays based on which elements 
% of the tring array satisfies the criteria. So this is not a table function, 
% it is a string function.

ar_st_col_names = tb_read.Properties.VariableNames;
ar_st_col_names_prod = ar_st_col_names(startsWith(ar_st_col_names, 'prod_'));
ar_st_col_names_esti = ar_st_col_names(endsWith(ar_st_col_names, '_esti'));
ar_st_col_names_sd = ar_st_col_names(contains(ar_st_col_names, '_sd_'));
disp(ar_st_col_names_prod');
disp(ar_st_col_names_esti');
disp(ar_st_col_names_sd');
%% 
% We can select columns that contain the string _sd_ as well as _actl_ in them, 
% by considering joint conditions.

ar_it_select = contains(ar_st_col_names, '_sd_').*endsWith(ar_st_col_names, '_actl');
ar_st_col_names_selected = ar_st_col_names(ar_it_select==1);
disp(ar_st_col_names_selected');
% show values from selected columns
disp(tb_read(1:10, ar_st_col_names_selected));