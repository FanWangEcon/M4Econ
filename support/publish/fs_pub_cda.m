%% Publish Command for Multiple M Files for Project Code Dynamic Asset
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Root

root = 'c:';
user = 'Users/fan';
project = 'CodeDynaAsset';
st_proj_folder = fullfile(root, user, project);

%% Publish Solve Folders 

cl_st_subfolder_solve = {'m_az/solve/', 'm_abz/solve/',...
                         'm_ipwkz/solve/', 'm_ipwkbzr/solve/'};
cl_st_subfolder_solve = {'m_abz/solve/'};                     
st_file_search_name = '*.m';
cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_solve, st_file_search_name};

%% Publish Test Folders 

cl_st_subfolder_test = {'m_az/test/ff_az_ds_vecsv/*/',...
                        'm_abz/test/ff_az_ds_vecsv/*/', ...
                        'm_ipwkz/test/ff_ipwkz_ds_vecsv/*/', ...
                        'm_ipwkbzr/test/ff_ipwkbzr_ds_vecsv/*/', ...
                        'm_fibs/test/ff_ipwkbzr_ds_vecsv/*/'};
                    
cl_st_subfolder_test = {'m_fibs/test/ff_ipwkbzr_ds_vecsv/*/'};
                    
st_file_search_name = '*grid.m';

cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_test, st_file_search_name};

%% Publish Specific Files

cl_st_subfolder_test = {'m_abz/test/ff_az_ds_vecsv/test_borr/'};
st_file_search_name = '*grid.m';
cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_test, st_file_search_name};

%% Publish Specific Files

cl_st_subfolder_test = {'m_abz/test/ff_az_ds_vecsv/test_borr/'};
st_file_search_name = '*grid.m';
cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_test, st_file_search_name};

%% Publish Specific Files A
cl_st_subfolder_test = {'m_fibs/simu/ff_ipwkbzr_ds_vecsv/'};
st_file_search_name = 'dense.m';
cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_test, st_file_search_name};

cl_st_subfolder_test = {'m_fibs/test/ff_ipwkbzr_ds_vecsv/test_borr/'};
st_file_search_name = 'fsi_ipwkbzr_fibs_borr_default_cross.m';

cl_st_subfolder_test = {'m_fibs/test/ff_ipwkbzr_ds_vecsv/test_pref/'};
st_file_search_name = 'fsi_ipwkbzr_fibs_pref_default_cross.m';

cl_st_subfolder_test = {'m_fibs/test/ff_ipwkbzr_ds_vecsv/*/'};
st_file_search_name = 'fsi_ipwkbzr_fibs_pref_default_cross.m';

cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder_test, st_file_search_name};

%% Publish Solve and Test and Other Folders 

cl_st_subfolder = [cl_st_subfolder_solve cl_st_subfolder_test];
st_file_search_name = '*.m';
cl_batch_func_inputs =  {st_proj_folder, cl_st_subfolder, st_file_search_name};

%% Batch Run

batch('ff_pub_batch', 0, cl_batch_func_inputs, 'Pool', 11);
