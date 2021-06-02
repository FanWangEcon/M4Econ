%% Matlab Join Tables by Keys
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Left Join Two Tables Together
% There is a table with simulation results, and a table with data information. 
% Join together with common keys.
% 
% First generate the simulation table.

% Make N by 2 matrix of fieldname + value type
mt_st_variable_names_types = [...
    ["year", "double"];["category", "string"];["rho", "double"]; ...
    ["numberWorkersSimu", "logical"]; ["meanWageSimu", "double"]];
% Make table using fieldnames & value types from above
tb_solution = table('Size',[0,size(mt_st_variable_names_types,1)],... 
	'VariableNames', mt_st_variable_names_types(:,1),...
	'VariableTypes', mt_st_variable_names_types(:,2));
% Table with data to be merged
tb_solution = [tb_solution;...
    {1, 'C001', 0.50, 5.5, 6.6}; {2, 'C002', 0.50, 3.3, 4.4}; ...
    {1, 'C001', 0.25, 2.5, 3.6}; {2, 'C002', 0.25, 0.3, 1.4}];
disp(tb_solution);
%% 
% Second generate the data table. 

% Make N by 2 matrix of fieldname + value type
mt_st_variable_names_types = [...
    ["year", "double"];["category", "string"]; ...
    ["numberWorkersData", "logical"]; ["meanWageData", "double"]];
% Make table using fieldnames & value types from above
tb_data = table('Size',[0,size(mt_st_variable_names_types,1)],... 
	'VariableNames', mt_st_variable_names_types(:,1),...
	'VariableTypes', mt_st_variable_names_types(:,2));
% Table with data to be merged
tb_data = [tb_data; {1, 'C001', 1, 2}; {2, 'C002', 2, 3}];
disp(tb_data);
%% 
% Third merge the tables together with left-join, that will match by all variables 
% with the same name.

% left-join tables together
tb_solu_joined_data = join(tb_solution, tb_data);
% Rescale a variable
tb_solu_joined_data{:, "numberWorkersData"} = tb_solu_joined_data{:, "numberWorkersData"}*10;
% Display
disp(tb_solu_joined_data);
%% 
%