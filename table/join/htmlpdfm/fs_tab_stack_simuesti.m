%% Matlab Table Stack and Join Estimation and Simulation Results
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Combine Tables Together Stack Rows Loop Template Common Columns
% There is an estimation routine, each time the routine outputs a table with 
% a single row, the single row contains estimation outputs including estiamtes, 
% standard erros, initial parameters etc. We loop over different estimation routines, 
% with different starting values etc, and rather than saving many tables, we want 
% to save a joint table with all rows stacked together.
% 
% This simply means that we have a loop, during each iteration, generating a 
% table, we want to stack things together. For this assume that the column names 
% are the same. 

for i=1:5
    % a row of coefficent estimates
    rng(123+i);
    it_num_cols = 4;
    it_num_rows = 1;
    mt_saveCoef = rand([it_num_rows, it_num_cols]);
    
    % row to table
    ar_st_col_names = ["FVAL", "EXITFLAG", "esti_iterations", "esti_funccount"];        
    tb_saveCoef = array2table(mt_saveCoef);
    tb_saveCoef.Properties.VariableNames = ar_st_col_names;
    
    % Stack all results
    if(i == 1)
        tb_saveCoef_stack = tb_saveCoef;
    else
        tb_saveCoef_stack = [tb_saveCoef_stack; tb_saveCoef];
    end
end
% Add esti Counter as column
estimodelctr = (1:size(tb_saveCoef_stack,1))';
tb_saveCoef_stack = addvars(tb_saveCoef_stack, estimodelctr, 'Before', 1);
% Add a row name as a variable
cl_row_names_a = strcat('esti', string((1:size(tb_saveCoef_stack,1))));
tb_saveCoef_stack.Properties.RowNames = cl_row_names_a;
% display results
disp(tb_saveCoef_stack);
%% Combine Tables Together Stack Rows Loop Template Outterjoin 
% Similar to the previous estimation problem, however, now during different 
% iterations, the column names, i.e. the parameters been estiamted are different. 
% For example, there are 10 parameters, sometimes we estimate 5 of the 10, sometimes 
% 10 or the 10. Want to stack all results together similar to above. 
% 
% This is accomplished in the following example with the <https://www.mathworks.com/help/matlab/ref/outerjoin.html 
% outerjoin function>.

for i=1:5   
    % a row of coefficent estimates
    rng(123+i);
    
    it_num_rows = 1;
    if (i <= 2) 
        it_num_cols = 4;
        mt_saveCoef = rand([it_num_rows, it_num_cols]);    
        % row to table    
        ar_st_col_names = ["FVAL", "EXITFLAG", "esti_iterations", "esti_funccount"];
    elseif (i <= 4) 
        it_num_cols = 2;
        mt_saveCoef = rand([it_num_rows, it_num_cols]);
        % row to table    
        ar_st_col_names = ["FVAL", "EXITFLAG"];
    else
        it_num_cols = 3;
        mt_saveCoef = rand([it_num_rows, it_num_cols]);
        % row to table    
        ar_st_col_names = ["FVAL", "esti_iterations", "esti_funccount"];
    end
    
    tb_saveCoef = array2table(mt_saveCoef);
    tb_saveCoef.Properties.VariableNames = ar_st_col_names;        
    
    % Stack all results
    if(i == 1)
        tb_saveCoef_stack = tb_saveCoef;
    else
        tb_saveCoef_stack = outerjoin(tb_saveCoef_stack, tb_saveCoef, 'MergeKeys', true);
    end
end
% Add esti Counter as column
estimodelctr = (1:size(tb_saveCoef_stack,1))';
tb_saveCoef_stack = addvars(tb_saveCoef_stack, estimodelctr, 'Before', 1);
% Add a row name as a variable
cl_row_names_a = strcat('esti', string((1:size(tb_saveCoef_stack,1))));
tb_saveCoef_stack.Properties.RowNames = cl_row_names_a;
% display results
disp(tb_saveCoef_stack);
%% ND Dimensional Parameter Arrays, Simulate Model and Stack Output Tables
% Now we will first column combine matrixes, model parameters and model outcomes, 
% and then row combine matrixes from different simulations.
% 
% A model takes a N parameters, solve the model over M sets of parameters. Each 
% time when the model is solved, a P by Q table of results is generated. Each 
% column is a different statistics (mean, std, etc.), and each row is a different 
% outcome variable (consumption, asset choices, etc.). Stack these P by Q Tables 
% together, and add in information about the N parameters, each of the tables 
% been stacked initially had the same column and row names.
% 
% The resulting table should have P times M rows, for M sets of model simulations 
% each with P rows of results. And there should be N + Q columns, storing the 
% N parameters as well as the Q columns of different outcomes. 

rng(123);
% Generate A P by Q matrix of random parameter Values
it_param_groups_m = 5; 
it_params_n = 2;
it_outcomes_p = 3;
it_stats_q = 3;

% Parameter Matrix and Names
ar_param_names = strcat('param_', string(1:it_params_n));
mt_param_m_by_n = round(rand([it_param_groups_m, it_params_n])*5, 2);

% Loop over the parameters
for it_cur_param_group=1:1:it_param_groups_m
    
    % Current Parameters
    ar_param = mt_param_m_by_n(it_cur_param_group,:);
    
    % Some Model is simulated
    mt_model_simu = normrnd(mean(ar_param), std(ar_param), [it_outcomes_p, it_stats_q]);
    
    % Model Results are Saved As Table With Column and Row Information
    tb_model_simu = array2table(mt_model_simu);
    cl_col_names = strcat('stats_', string((1:size(mt_model_simu,2))));
    cl_row_names = strcat('outvar_', string((1:size(mt_model_simu,1))));
    tb_model_simu.Properties.VariableNames = cl_col_names;
    tb_model_simu.Properties.RowNames = cl_row_names;    
        
    % Convert Row Variable Names to a Column String
    outvar = string(tb_model_simu.Properties.RowNames);
    tb_model_simu = addvars(tb_model_simu, outvar, 'Before', 1);
    
    % Parameter Information Table that Shares Row Names as Simu Results
    mt_param_info = zeros([it_outcomes_p,it_params_n]) + ar_param;
    tb_param_info = array2table(mt_param_info);
    tb_param_info.Properties.VariableNames = ar_param_names;
    tb_param_info.Properties.RowNames = cl_row_names;
    
    % Combine Parameter Information and Simulation Contents
    tb_model_simu_w_info = [tb_param_info tb_model_simu];
    % Update Row Names based on total row available
    ar_rows_allsimu = (1:it_stats_q)' + (it_cur_param_group-1)*it_stats_q;
    tb_model_simu_w_info.Properties.RowNames = strcat('row=', string(ar_rows_allsimu));
    
    % Show One Example Table before Stacking
    if (it_cur_param_group == round(it_param_groups_m/2))
        disp(tb_model_simu);
        disp(tb_param_info);
        disp(tb_model_simu_w_info);
    end
    
    % Stack all results
    if(it_cur_param_group == 1)
        tb_model_allsimu_w_info = tb_model_simu_w_info;
    else
        tb_model_allsimu_w_info = [tb_model_allsimu_w_info; tb_model_simu_w_info];
    end
    
end
%% 
% Show all Simulation Joint Table Outputs:

disp(tb_model_allsimu_w_info);