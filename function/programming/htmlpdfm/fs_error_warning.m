%% Matlab Error and Warning Handling
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Turn off Warning Messages
% During estimation, at some parameter values, estimation routine generates 
% warnings messages. These warning messages fill up the screen and makes it hard 
% to track estimation outputs. In the example below, we run an OLS regression 
% that generates a warning message. We turn the message off, and then we turn 
% the message on again.
% 
% First run a regression that generates a <https://www.mathworks.com/help/matlab/ref/lastwarn.html 
% warning message>.

% OLS Regression
fci_ols_lin = @(y, x) (x'*x)^(-1)*(x'*y);
% Regression inputs
ar_y = [1;1];
mt_x = [0 0; 0 0];
% Estimates
ar_esti = fci_ols_lin(ar_y, mt_x);
%% 
% Second, identify and turn off the warning message. 

% Check warning message and warning ID of the last message.
[st_msg, st_warnID] = lastwarn;
% Turn off earning message
warning('off', st_warnID);
% Estimates no longer generates warning
ar_esti = fci_ols_lin(ar_y, mt_x);
%% 
% Third, turn warning message back on.

% Warning message back on
warning('on', st_warnID);
% Estimates generates warning again
ar_esti = fci_ols_lin(ar_y, mt_x);
%%