%% Multidimensional ND Array to 2D Matrix with Wide to Long
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% 2D Matrix Wide to Long
% There is a 2D matrix, the rows and columns are state variables (savings levels 
% and shocks) for storage and graphing purposes, convert the 2D matrix where each 
% row is a savings level and each column is a shock level to a 2D table where 
% the first column records savings state, second column the level of shocks, and 
% the third column stores the optimal policy or value at that particular combination 
% of savings level and shock level. 
% 
% First, generate a random 2D matrix:

% Create a 3D Array
it_z_n = 3;
it_a_n = 5;
% shock savings and shock array
ar_a = linspace(0.1, 50, it_a_n);
ar_z = linspace(-3, 3, it_z_n);
% function of a and z
mt_f_a_z = ar_a' + exp(ar_z);
% Display
disp(mt_f_a_z);
%% 
% Second, from linear index to row and column index:

% Row and Column index for each matrix value
% Only keep non-NAN values
ar_id_isnan = isnan(mt_f_a_z);
[ar_a_idx, ar_z_idx] = ind2sub(size(mt_f_a_z), find(~ar_id_isnan));
% Display
disp([ar_a_idx, ar_a(ar_a_idx)', ar_z_idx, ar_z(ar_z_idx)']);
%% 
% Third, generate a 2d matrix in "table" format:

% Index and values
mt_policy_long = [ar_a_idx, ar_a(ar_a_idx)', ar_z_idx, ar_z(ar_z_idx)', mt_f_a_z(~ar_id_isnan)];
% Sort by a and z
mt_policy_long = sortrows(mt_policy_long, [1,3]);
%% 
% Fourth, generate a Table with Column names:

% Create Table
tb_policy_long = array2table(mt_policy_long);
cl_col_names_a = {'a_idx', 'a_val', 'z_idx', 'z_val', 'pol_at_a_z'};
tb_policy_long.Properties.VariableNames = cl_col_names_a;
disp(tb_policy_long);
%% A Multidimensional ND Array with Many NaN Values
% Continue with the previous exercise, but now we have more than 2 state variables. 
% 
% Create a multidimensional Array with Many NaN Values. For example, we could 
% have a dynamic lifecycle model with three endogenous varaibles, years of education 
% accumulated, years of experiencesin blue and white collar jobs. By age 22, after 
% starting to work at age 16, there are different possible combinations of G (schooling), 
% X1 (white-collar), and X2 (blue-collar) jobs. These are exclusive choices in 
% each year, so at age 16, assume that G = 0, X1 = 0 and X2 = 0. At age 16, they 
% can choose to stay at home, school, or X1, or X2, exclusively. G, X1, X2 accumulate 
% over time. 
% 
% For each age, we can create multi-dimensional arrays with equal dimension 
% for G, X1 and X2, to record consumption, value, etc at each element of the possible 
% state-space. However, that matrix could have a lot of empty values. 
% 
% In the example below, also has a X3 (military category).

% random number
rng(123);

% Max age means number of
MAX_YRS_POST16 = 3;

% store all
cl_EV = cell(MAX_YRS_POST16,1);

% Loop 1, solve BACKWARD
for it_yrs_post16=MAX_YRS_POST16:-1:1
    
    % Store some results, the matrix below includes all possible
    % state-space elements
    mn_ev_at_gx123 = NaN(it_yrs_post16, it_yrs_post16, it_yrs_post16, it_yrs_post16);
    
    % Loops 2, possibles Years attained so far as well as experiences
    for G=0:1:(it_yrs_post16-1)
        for X1=0:1:(it_yrs_post16-1-G)
            for X2=0:1:(it_yrs_post16-1-G-X1)
                for X3=0:1:(it_yrs_post16-1-G-X1-X2)
                    
                    % Double checkAre these combinations feasible?
                    if (G+X1+X2+X3 <= it_yrs_post16)
                        % just plug in a random number
                        mn_ev_at_gx123(G+1, X1+1, X2+1, X3+1) = rand();
                    end
                end
            end
        end
    end
    
    % store matrixes
    cl_EV{it_yrs_post16} = mn_ev_at_gx123;
    
end

% Display Results
celldisp(cl_EV);
%% Generate a Two Dimensional Matrix Based on ND Array for Only non-NaN Cell Values
% We can generate a 2-dimensional matrix, what we can consider as a Table, with 
% the information stored in the structures earlier. In this example, we can drop 
% the NaN values. This matrix will be much larger in size due to explicitly storing 
% X1, X2, X3 and G values then the ND array when most values are not NaN. But 
% this output matrix can be much more easily interpretable and readable. When 
% there are many many NaNs in the ND array, this matrix could be much smaller 
% in size. 
% 
% First, convert each element of the cell array above to a 2D matrix (with the 
% same number of columns), then stack resulting matrixes together to form one 
% big table.

% Create a 2D Array
for it_yrs_post16=MAX_YRS_POST16:-1:1
    % Get matrix at cell element
    mn_ev_at_gx123 = cl_EV{it_yrs_post16};
    % flaten multi-dimensional matrix
    ar_ev_at_gx123_flat = mn_ev_at_gx123(:);
    % find nan values
    ar_id_isnan = isnan(ar_ev_at_gx123_flat);
    % obtain dimension-specific index for nan positions
    [id_G, id_X1, id_X2, id_X3] = ind2sub(size(mn_ev_at_gx123), find(~ar_id_isnan));
    % generate 2-dimensional matrix (table)
    mt_ev_at_gx123 = [it_yrs_post16 + zeros(size(id_G)), ...
        (id_G-1), (id_X1-1), (id_X2-1), (id_X3-1), ...
        ar_ev_at_gx123_flat(~ar_id_isnan)];
    % stack results
    if (it_yrs_post16 == MAX_YRS_POST16)
        mt_ev_at_gx123_all = mt_ev_at_gx123;
    else
        mt_ev_at_gx123_all = [mt_ev_at_gx123_all; mt_ev_at_gx123];
    end
end
% Sort
mt_ev_at_gx123_all = sortrows(mt_ev_at_gx123_all, [1,2,3,4]);
% Create Table
tb_ev_at_gx123_all = array2table(mt_ev_at_gx123_all);
cl_col_names_a = {'YRS_POST16', 'G', 'X1', 'X2', 'X3', 'EV'};
tb_ev_at_gx123_all.Properties.VariableNames = cl_col_names_a;
disp(tb_ev_at_gx123_all);
%% Mesh Three Vectors Together then Generate A Flat Table
% There are three parameters, quadratic of preference, height preference, and 
% reference points preference. Mesh three vectors together with ndgrid. Then generate 
% a flat table with the index of the parameters as well as the values of the parameters. 

% Generate Arrays
[it_quadc, it_linh, it_refh] = deal(2, 2, 2);
ar_fl_quadc = linspace(-0.01, -0.001, it_quadc);
ar_fl_linh = linspace(0.01, 0.05, it_linh);
ar_fl_refh = linspace(-0.01, -0.05, it_refh);
% ndgrid mesh together
[mn_fl_quadc, ~] = ndgrid(ar_fl_quadc, ar_fl_linh, ar_fl_refh);
% combine
[ar_it_quadc_idx, ar_it_linh_idx, ar_it_refh_idx] = ind2sub(size(mn_fl_quadc), find(mn_fl_quadc));
% Index and values
mt_paramsmesh_long = [ar_it_quadc_idx, ar_fl_quadc(ar_it_quadc_idx)', ...
    ar_it_linh_idx, ar_fl_linh(ar_it_linh_idx)', ...
    ar_it_refh_idx, ar_fl_refh(ar_it_refh_idx)'];
% Sort by a and z
mt_paramsmesh_long = sortrows(mt_paramsmesh_long, [1,3, 5]);
%% 
% Generate a table with Column names:

% Create Table
tb_paramsmesh_long = array2table(mt_paramsmesh_long);
cl_col_names_a = {'quadc_idx', 'quadc_val', 'linh_idx', 'linh_val', 'refh_idx', 'rehfh_val'};
tb_paramsmesh_long.Properties.VariableNames = cl_col_names_a;
disp(tb_paramsmesh_long);