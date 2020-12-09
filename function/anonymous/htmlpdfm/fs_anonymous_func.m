%% Anonymous Function in Matlab
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Define a Wage Equation with Partial Income for Part-time Workss
% Individuals might work part or full time. Define a mincer wage equation that 
% is a function of experienc, education and other individual characteristics. 
% 
% First define parameters.

% Experience
COEF_beta_psi_0 = 1.8884;
COEF_beta_psi_k = 0.0767;
COEF_beta_psi_kk = -0.2683;
% Education
COEF_beta_psi_e0 = 0.0465;
COEF_beta_w_e_1 = 0.1432;
COEF_beta_w_e_2 = 0.1435;
COEF_beta_w_e_3 = 0.2806;
% for part time
COEF_beta_w_part_0 = -0.0082;
COEF_beta_w_part_1 = -0.4863;
%% 
% Second define the log wage equation. This wage equation is a function of the 
% parameters defined above, and also Education (ED), experience (EX) and the wage 
% shcok (EPS_w).

% Log of wage
f_log_psi = @(ED, EX) ...
    COEF_beta_psi_0 ...
    + COEF_beta_psi_k.*EX ...
    + COEF_beta_psi_kk.*(EX.^2/100) ...
    + COEF_beta_psi_e0.*(ED - 12) ...
    + COEF_beta_w_e_1.*(ED == 12) ...
    + COEF_beta_w_e_2.*(ED > 12).*(ED < 16) ...
    + COEF_beta_w_e_3.*(ED >= 16);
%% 
% Third, define wage, which might differ depending on work status as well as 
% schooling status. D_e is schooling or not, which can take values of 0 or 1. 
% D_k is work status, which can take values or 0, 0.5 (part-time work) and 1 (full-time 
% work).

% Per hour wage considering part time, part time wage differ if also schooling
f_hr_wage = @(D_e, D_k, ED, EX) ...
    exp(f_log_psi(ED, EX)).*exp((D_k==0.5).*(COEF_beta_w_part_0 + COEF_beta_w_part_1.*D_e));
% Total wage
f_wage = @(D_e, D_k, ED, EX) ...
    f_hr_wage(D_e, D_k, ED, EX).*(2080.*(D_k == 1) + 1040.*(D_k == 0.5) + 0.*(D_k == 0));
%% 
% Fourth, test the wage equation by calling it with different work and schooling 
% choices, along with different education, experience, and shock levels.

% no experience, education, not school, not work
disp(['f_wage(0,0,0,0,0)=' num2str(f_wage(0,0,0,0))]);
% no experience, education, part-time
disp(['f_wage(0,0.5,0,0,0)=' num2str(f_wage(0,0.5,0,0))]);
% no experience, education, full-time
disp(['f_wage(0,1,0,0,0)=' num2str(f_wage(0,1,0,0))]);
%