%% Nonlinear Estimation with Fminunc
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Nonlinear Estimation Inputs LHS and RHS
% Estimate this equation: $\omega_t =\left(\nu_0 + a_0\right) + a_1 t - \log\left(1 
% - \exp\left( a_0 + a_1 t\right)\right) + \nu_t$. We have data from multiple 
% $t$, and want to estimate the $a_0$, and $a_1$ coefficients mainly, but also 
% $\nu_0$ is good as well. This is an estimation problem with 3 unknowns. $t$ 
% ranges from 

% LHS outcome variable
ar_w = [-1.7349,-1.5559,-1.4334,-1.3080,-1.1791,-1.0462,-0.9085,-0.7652,-0.6150,-0.4564,-0.2874,-0.1052,0.0943];
% RHS t variable
ar_t = [0,3,5,7,9,11,13,15,16,19,21,23,25];
% actual parameters, estimation checks if gets actual parameters back
ar_a = [-1.8974, 0.0500];
%% Prediction and MSE Equations
% Objective function for prediction and mean-squared-error.

obj_ar_predictions = @(a) (v_0 + a(1) + a(2).*ar_t - log(1 - exp(a(1) + a(2).*ar_t)));
obj_fl_mse = @(a) mean((obj_ar_predictions(a) - ar_w).^2);
%% 
% Evaluate given ar_a vectors.

ar_predict_at_actual = obj_ar_predictions(ar_a);
fl_mse_at_actual = obj_fl_mse(ar_a);
mt_compare = [ar_w', ar_predict_at_actual'];
tb_compare = array2table(mt_compare);
tb_compare.Properties.VariableNames = {'lhs-outcomes', 'evaluate-rhs-at-actual-parameters'};
disp(tb_compare);
%% Unconstrained Nonlinear Estimation
% Estimation to minimize mean-squared-error.

% Estimation options
options = optimset('display','off');
% Starting values
ar_a_init = [-10, -10];
% Optimize
[ar_a_opti, fl_fval] = fminunc(obj_est, ar_a_init, options);
%% 
% Compare results.

mt_compare = [ar_a_opti', ar_a'];
tb_compare = array2table(mt_compare);
tb_compare.Properties.VariableNames = {'estimated-best-fit', 'actual-parameters'};
disp(tb_compare);