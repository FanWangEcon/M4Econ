%% Concatenate Strings Arrays with Numbers and Number Arrays with Strings
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Combine A String Array with A Numeric Array using Compose
% String array and numeric array, combine together using the compose function, 
% and test different formatting functions. Formating with leading empty spaces, 
% leading zeros, and convert to integer or not.

st_titles = ["%.3f",   "%.1f",   "%.0f";...
             "%6.3f",  "%6.1f",  "%6.0f";...
             "%06.3f", "%06.1f", "%06.0f"];
ar_params = 123.4567890 + zeros(3,3);
st_combo = compose(st_titles, ar_params);
disp(st_combo);
%% 
% A string array and a numeric array combined

ls_st_param_esti = {'ar_mu_pos_1', 'ar_COEF_U_gamma'};
ar_params = [1213,456];
st_combo = strcat(ls_st_param_esti', '=', num2str(ar_params'));
disp(st_combo);
%% Title from an Array of Values
% There is a vector of parameter values and a vector of names for these parameter 
% values, I want to include these in the title of a figure with the same decimal 
% formating. 

% Inputs
rng(123);
ar_params = rand(1,3);
ar_st_parms_names = ["param1", "param2", "param3"];
st_rounding = '.2f';
st_title_main = "this is the figure title";
% Rounding and combining
ar_st_params = strcat(ar_st_parms_names, compose(strcat("=%", st_rounding), ar_params));
% Generate a Single String that is comma separated:
st_param_pasted = strjoin(ar_st_params, ', ');
% Generate title with parameters
st_title_wth_params = strcat(st_title_main, ' (', st_param_pasted, ')');
% Display:
disp(st_title_wth_params);
%% Combine String with Numeric Array
% Example 1:

ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
disp([num2str(ar_fl_abc1', 'zw=%3.2f;'), num2str(ar_fl_abc1', 'zr=%3.2f')]);
%% 
% Example 2:

close all;

rng(123);
ar_z_r_borr_mesh_wage = rand([1,5]);
ar_z_wage_mesh_r_borr = rand([1,5]);
ar_it_rows = round(rand([1,5])*10);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage', 'zr=%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr', 'zw=%3.2f')]);
cl_col_names = strcat('zi=', num2str(ar_it_rows([1,3,5])'), ':', cl_st_full_rowscols([1,3,5]));
disp(ar_z_r_borr_mesh_wage);
disp(ar_z_wage_mesh_r_borr);
disp(cl_st_full_rowscols);
disp(cl_col_names);
%% Combine Number with String Cell Array
% We have a string cell array we created from the previous section, now append 
% numbers to it

% Append Common Numbers
cl_col_names_append = strcat(cl_col_names, '-String-Cell-With-Numeric-', num2str(123));
disp(cl_col_names_append);
%% Combine Numeric Array with String Cell Array
% Append an array of numeric values

% Append Common Numbers
cl_col_names_append = strcat(cl_col_names, '-String-Cell-With-Numeric-Array-', ...
    num2str(transpose(1:length(cl_col_names))));
disp(cl_col_names_append);
%% Convert Numeric Array to String, Apeend Prefix to all elements.

ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_st_wth_prefix = strcat('row=', string(ar_fl_abc1));
disp(ar_st_wth_prefix);

% Does Array Exist in Longer Array as Subset
ar_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_abc2 = [0.4 0.1 0.2 0.3 0.4];
ar_efg = [0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4];
st_abc1 = strjoin(string(num2str(ar_abc1)));
st_abc2 = strjoin(string(num2str(ar_abc2)));
st_efg = strjoin(string(num2str(ar_efg)));
contains(st_efg, st_abc1)
contains(st_efg, st_abc2)

% Display Convert to String
fprintf('Display string [%s]', num2str([1,2,3]));
fprintf('Display string [%s]', num2str(1.1));
fprintf('Display string [%s]', 'abc');