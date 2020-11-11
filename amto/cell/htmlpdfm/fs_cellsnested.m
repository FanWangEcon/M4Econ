%% Nested Cells
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Nested Cells and access

cl_st_param_keys = {'fl_crra', 'fl_beta'};

it_simu_vec_len = 3;
clns_parm_tstar = cell([4,1]);
clns_parm_tstar{1} = {'fl_crra', 'CRRA', linspace(1, 2, it_simu_vec_len)};
clns_parm_tstar{2} = {'fl_beta', 'Discount', linspace(0.94, 0.98, it_simu_vec_len)};
clns_parm_tstar{3} = {'w', 'Wage', linspace(1.1, 1.4, it_simu_vec_len)};
clns_parm_tstar{4} = {'r', 'Save Interest', linspace(0.01, 0.04, it_simu_vec_len)};

disp(clns_parm_tstar(1));
disp(clns_parm_tstar{1}{1})
disp(clns_parm_tstar{1}{2});
disp(clns_parm_tstar{1}{3});