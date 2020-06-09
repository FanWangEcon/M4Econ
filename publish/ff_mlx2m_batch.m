%% Convert MLX to M and HTML then Publish
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

function ff_mlx2m_batch(varargin)

%% Default Parameters
% assume CodeDynaAsset is on the root folder 

root = 'c:';
user = 'Users/fan';
project = 'Math4Econ';
st_proj_folder = fullfile(root, user, project);

cl_st_subfolder = {'calconevar/'};
st_file_name_mlx = '*.mlx';

st_pub_format = 'html';
bl_show_browser = true;
bl_publish = true;

cl_params = {st_proj_folder cl_st_subfolder st_file_name_mlx ...
                st_pub_format bl_show_browser bl_publish};

%% Parse Parameters

[cl_params{1:length(varargin)}] = varargin{:};

st_proj_folder = cl_params{1};
cl_st_subfolder = cl_params{2};
st_file_name_mlx = cl_params{3};
st_pub_format = cl_params{4};
bl_show_browser = cl_params{5};
bl_publish = cl_params{6};

%% Add Path
% set up path components

addpath(genpath(st_proj_folder));

%% Search Files
% generate html publish document

[cl_st_file_names, cl_st_folder_names] = ...
    ff_find_files(st_proj_folder, cl_st_subfolder, st_file_name_mlx);

%% Test Single Conversion 
cd C:\Users\fan\Math4Econ\matrix_application
matlab.internal.liveeditor.openAndConvert('KL_borrowhire_firm.mlx', 'KL_borrowhire_firm.tex')
          
%% Publish Files

% generate html for each file
for it_file_ctr = 1:length(cl_st_file_names)
    
    % get file name and path
    st_file_name_mlx = cl_st_file_names{it_file_ctr};
    file_folder = cl_st_folder_names{it_file_ctr};
    
    % Generate .m file names
    at_st_split_file_name = split(st_file_name_mlx, ".");
    st_file_name_m = strcat(at_st_split_file_name{1}, '_m.m');
    st_file_name_html = strcat(at_st_split_file_name{1}, '.html');
    st_file_name_pdf = strcat(at_st_split_file_name{1}, '.pdf');
    st_file_name_tex = strcat(at_st_split_file_name{1}, '.tex');
    
    % get full path to .m and .mlx
    st_file_full_mlx = fullfile(file_folder, st_file_name_mlx);
    st_file_full_m = fullfile(file_folder, st_file_name_m);
    st_file_full_html = fullfile(file_folder, st_file_name_html); 
    st_file_full_pdf = fullfile(file_folder, st_file_name_pdf); 
    st_file_full_tex = fullfile(file_folder, st_file_name_tex); 
    disp(st_file_name_mlx);
    disp(st_file_name_m);
    disp(st_file_full_html);
    disp(st_file_full_pdf);
    disp(st_file_full_tex);
    
%     % convert from .mlx to .m
%     matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_m)    
%     % convert from .mlx to .html
%     matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_html)
%     % convert from .mlx to .pdf
%     matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_pdf)
    % convert from .mlx to .tex
    matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_tex)
    
    % generate documentation, convert .m to .m publish html
    if (bl_publish)
        f_html = publish(st_file_full_m, st_pub_format);
        disp(f_html);
    end
    
    % show in browser
    if (bl_publish && bl_show_browser)
        web(f_html, '-browser');
    end
    
end
% delete(gcp('nocreate'));

end

