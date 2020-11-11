%% Multidimensional ND Array to 2D Matrix with Nan Exclusions
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% A Multidimensional ND Array with Many NaN Values
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