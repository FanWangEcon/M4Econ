%% String: Concatenate Strings Arrays with Numbers and Number Arrays with Strings
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Combine String with Numeric Array

close all;

rng(123);
ar_z_r_borr_mesh_wage = rand([1,5]);
ar_z_wage_mesh_r_borr = rand([1,5]);
ar_it_rows = round(rand([1,5])*10);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage', 'zr=%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr', 'zw=%3.2f')]);
cl_col_names = strcat('zi=', num2str(ar_it_rows([1,3,5])'), ':', cl_st_full_rowscols([1,3,5]));

disp(ar_z_r_borr_mesh_wage)
disp(ar_z_wage_mesh_r_borr)
disp(cl_st_full_rowscols)
disp(cl_col_names)

%% Combine Number with String Cell Array
% We have a string cell array we created from the previous section, now
% append numbers to it

% Append Common Numbers
cl_col_names_append = strcat(cl_col_names, '-String-Cell-With-Numeric-', num2str(123));

disp(cl_col_names_append)

%% Combine Numeric Array with String Cell Array
% Append an array of numeric values

% Append Common Numbers
cl_col_names_append = strcat(cl_col_names, '-String-Cell-With-Numeric-Array-', ...
    num2str(transpose(1:length(cl_col_names))));

disp(cl_col_names_append)
