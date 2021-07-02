%% Generate a Table and Fill with Data Row by Row or Random Data
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% An Empty Table, Filled with Loop Row by Row
% First, generate <https://www.mathworks.com/matlabcentral/answers/244084-is-there-a-simpler-way-to-create-an-empty-table-with-a-list-of-variablenames#answer_422250 
% an empty table>.

% Make N by 2 matrix of fieldname + value type
mt_st_variable_names_types = [["category", "string"]; ...
    ["wage", "double"]; ...
    ["skilled", "logical"]; ...
    ["labdemand", "double"]; ...
    ["labsupply", "double"]; ...
    ["labsupplyprob", "string"]; ...
    ["rho_manual", "double"]; ...
    ["rho_routine", "double"]; ...
    ["rho_analytical", "double"]; ...
    ];
% Make table using fieldnames & value types from above
tb_equilibrium = table('Size',[0,size(mt_st_variable_names_types,1)],... 
	'VariableNames', mt_st_variable_names_types(:,1),...
	'VariableTypes', mt_st_variable_names_types(:,2));
% display table
disp(size(tb_equilibrium));
%% 
% Second, over a loop, fill the table with values row by row. 

for it_rho_set=[1,2,3]
    if (it_rho_set == 1)
        cl_data_row = {'C001',1,  true,1,1,0.5,0.5,0.5,0.5};
    elseif (it_rho_set == 2)
        cl_data_row = {'C002',1,  0   ,1.2,0.6,0.5,0.45,0.5,0.5};
    elseif (it_rho_set == 3)
        cl_data_row = {'C011',1.1,false,1.2,0.6,0.5,0.45,0.45,0.45};
    end
    tb_equilibrium = [tb_equilibrium; cl_data_row];
end
disp(tb_equilibrium);
%% Data Assignment to Table Cell Value
% Given an existing table, we might want to replace values in specific tables 
% cells. There are two main methods to accomplish as shown below. If the string 
% name is known, the TAB.COL(ROW) replacement method is dramatically faster. Test 
% speed with timeit first loading the value in table cell via method a vs b, method 
% a takes 20 to 30 times more time than method b. Then test assigment with tic 
% toc, with about a 7 time speed difference. 

% Two replacement functions
f_replace_method_a = @() tb_equilibrium{1, "labdemand"};
f_replace_method_b = @() tb_equilibrium.labdemand(1);

% Time replacing one value
fl_speed_method_a = timeit(f_replace_method_a);
fl_speed_method_b = timeit(f_replace_method_b);
fl_speed_a_b_ratio = fl_speed_method_a/fl_speed_method_b;
disp(['Load table cell time, fl_speed_a_b_ratio=' num2str(fl_speed_a_b_ratio)]);

% Timing assignment with Method A
ar_rand = rand([1,1e4]);
fl_time_start = tic;
for (fl_rand=ar_rand)
    tb_equilibrium{1, "labdemand"} = fl_rand;
end
fl_time_end = toc(fl_time_start);
disp(['Method A assigment fl_time_end = ' num2str(fl_time_end)]);

% Timing assignment with Method A
fl_time_start = tic;
for (fl_rand=ar_rand)
    tb_equilibrium.labdemand(1) = fl_rand;
end
fl_time_end = toc(fl_time_start);
disp(['Method B assignment fl_time_end = ' num2str(fl_time_end)]);
%% Generate a Table with M Variables of Random Data
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
rng(456);
cl_st_var1 = strcat('data=', string(rand([it_num_rows,1])));
cl_st_var2 = strcat('data=', string(rand([it_num_rows,1])));
tb_test = addvars(tb_test, cl_st_var1, cl_st_var2);

% Display Table
disp(tb_test);