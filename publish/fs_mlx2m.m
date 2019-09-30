%% Convert Varioius MLXs to M files
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Save a single mlx file as m file

st_mlx_file = 'C:/Users/fan/M4Econ/publish/fs_mlx_test.mlx';
st_m_file = 'C:/Users/fan/M4Econ/publish/fs_mlx_test_m.m';

matlab.internal.liveeditor.openAndConvert(st_mlx_file, st_m_file)

%% Save Results for Math4Econ

root = 'c:';
user = 'Users/fan';
project = 'Math4Econ';
project = 'M4Econ';
st_proj_folder = fullfile(root, user, project);

cl_st_subfolder = {'calconevar/', 'derivative/', 'derivative_application/'};
cl_st_subfolder = {'matrix_basics/'};
cl_st_subfolder = {'graph/export/'};
cl_st_subfolder = {'support/array/', 'support/string/', 'support/cells/', 'support/container/'};
cl_st_subfolder = {'support/container/'};

st_file_name_mlx = '*.mlx';
st_pub_format = 'html';
bl_show_browser = true;
bl_publish = false;
ff_mlx2m_batch(st_proj_folder, cl_st_subfolder, st_file_name_mlx, ...
                st_pub_format, bl_show_browser, bl_publish)