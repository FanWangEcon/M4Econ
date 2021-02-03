%% Matlab Graph One Variable Function
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% fplot a Function of X
% Given a cubic (polynomial) function, graph it using the fplot function, between 
% some values along the domain of the function. This function is defined everywhere 
% along the real-line. Note that fplot automatically resizes the y-scale to show 
% the full plot clearly.

close all
figure();
hold on;

% Define a function
syms x
f_x = -7*x^(3);

% Set bounds on the domain
fl_x_lower = -2;
fl_x_higher = 2;

% Graph
fplot(f_x, [fl_x_lower, fl_x_higher])

% Add x-axis and y-axis
xline(0);
yline(0);

% Title and y and y-able
title(['Plot function: ' char(f_x)],'Interpreter',"none");
ylabel('f(x)');
xlabel('x');

% Add grids
grid on;
grid minor;
%% 
% Plot a rational function, that is a function of polynomials.

close all
figure();
hold on;

% Define a function
syms x
f_x = (x)/(x^2 + 1);

% Set bounds on the domain
fl_x_lower = -2;
fl_x_higher = 2;

% Graph
fplot(f_x, [fl_x_lower, fl_x_higher])

% Add x-axis and y-axis
xline(0);
yline(0);

% Title and y and y-able
title(['Plot function: ' char(f_x)],'Interpreter',"none");
ylabel('f(x)');
xlabel('x');

% Add grids
grid on;
grid minor;
%% 
% Plot a function that is not defined at all points along the real line. Note 
% also that the function always returns a positive value. Note the fplot function 
% automatically identifies the part of the x-axis where the function is not defined, 
% and draws dashed lines to demarcate. 

close all
figure();
hold on;

% Define a function
syms x
f_x = 5*(x^5 - 6*x^2 + 3*x)^(2/3);

% Set bounds on the domain
fl_x_lower = -1;
fl_x_higher = 2;

% Graph
fplot(f_x, [fl_x_lower, fl_x_higher])

% Add x-axis and y-axis
xline(0);
yline(0);

% Title and y and y-able
title(['Plot function: ' char(f_x)],'Interpreter',"none");
ylabel('f(x)');
xlabel('x');

% Add grids
grid on;
grid minor;