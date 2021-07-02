%% This fiel is for testing things out.

% Generate a 3 by 3 matrix of random values
rng(3);
it_row_n = 3;
it_col_n = 3;
mt_rhs = rand([it_row_n, it_col_n]);

% Generate true coefficients
ar_beta_true = rand([it_row_n, 1]);

% Generate LHS, given true parameter
ar_lhs = mt_rhs*ar_beta_true;

% OLS regression function
fc_ols_lin = @(y, x) (x'*x)^(-1)*(x'*y)

% Estimate
ar_beta_esti = fc_ols_lin(ar_lhs, mt_rhs);

% Display
tb_beta = array2table([ar_beta_true, ar_beta_esti]);
cl_col_names = ["beta true", "beta estimates"];
cl_row_names = strcat('row_coef_', string((1:it_row_n)));
tb_beta.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_beta.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);
disp(tb_beta);

% 2021-06-30 06:07
% Quoatient and Modulus
% Given an array of integer values, and some divisor, find the quotient and remainder.

it_divisor = 10;
for bl_int=[0,1]
    if (bl_int == 1)
        ar_integers = int16([1,2,3, 11,12,13, 21,22,23]);
    else
        ar_integers = [1,2,3, 11,12,13, 21,22,23];
    end
    for it_integer=ar_integers
        % Modulus and quotient
        if(isinteger(it_integer))
            it_quotient = idivide(it_integer, it_divisor);
        else
            it_quotient = fix(it_integer/it_divisor);
        end
        it_remainder = rem(it_integer, it_divisor);

        if (it_remainder == 1)
            fl_power = 1.0;
        elseif (it_remainder == 2)
            fl_power = 1.5;
        elseif (it_remainder == 3)
            fl_power = 2.0;
        end

        if (it_quotient == 0)
            fl_base = 2;
        elseif (it_quotient == 1)
            fl_base = exp(1);
        elseif (it_quotient == 2)
            fl_base = 10;
        end

        fl_value = fl_base^fl_power;

        % Print
        st_print = strjoin(...
            ["Divide test:", ...
            ['bl_int=' num2str(bl_int)], ...
            ['it_integer=' num2str(it_integer)], ...
            ['it_remainder=' num2str(it_remainder)], ...
            ['it_quotient=' num2str(it_quotient)], ...
            ['fl_value=' num2str(fl_value)], ...
            ], ";");
        disp(st_print);

    end
end

%% 2021-06-30 20:07
% During estimation, at some parameter values, estimation routine generates warnings messages. These warning messages fill up the screen and makes it hard to track estimation outputs. In the example below, we run an OLS regression that generates a warning message. We turn the message off, and then we turn the message on again.

% OLS Regression
fci_ols_lin = @(y, x) (x'*x)^(-1)*(x'*y)
% Regression inputs
ar_y = [1;1];
mt_x = [0 0; 0 0]
% Estimates
ar_esti = fci_ols_lin(ar_y, mt_x);

%% 2021-07-01 09:36
% Datestring

st_file_suffix = ['_d' datestr(now,'yymmdd_tHHMMSS')]

%% 2021-07-01 17:15
% There is a program that we have written. We want to know which lines of code is taking more or less time, and identify opportunities for speed improvement. Use Matlab Profiler to run through code and generate performance report line by line. This can be achieved by clicking on the Run and Time button under the Editor Pane. Below, we start the profiler inline, run a function, and save profiling results to a HTML file. The function below finds the file to the current m file where the profiler is running at, and generates a subfolder which will contain a subfolder that contains all HTML results from a particular profiler timing run. 

% Define profiling folder and file names
% Find current path to m file and generates profiling subfolder
srn_profile_folder = '_profile';
% Name of the profling output folder (including HTML files)
srn_mprofile_subfolder = 'fs_profiler_tester';

% Turn profiler on
profile on

% OLS Regression
fci_ols_lin = @(y, x) (x'*x)^(-1)*(x'*y);
% Regression inputs
it_obs_n = 10000;
it_k_n = 5;
rng(123);
ar_y = rand([it_obs_n,1]);
mt_x = rand([it_obs_n, it_k_n]);
% Regression
ar_esti = fci_ols_lin(ar_y, mt_x);

% Turn Profiler off
profile off;

% Save profiling results to file
% Find current file folder and generate a profiling subfolder
spn_path2file = matlab.desktop.editor.getActiveFilename;
[spt_path_folder_root, ~, ~] = fileparts(spn_path2file);
spn_profiler = fullfile(spt_path_folder_root, srn_profile_folder);
if ~exist(spn_profiler, 'dir')
    mkdir(spn_profiler);
end

% Store results to file
spn_profiler_results = fullfile(spn_profiler, srn_mprofile_subfolder);
profsave(profile('info'), spn_profiler_results);
