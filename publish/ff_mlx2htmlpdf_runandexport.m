%% Convert MLX to M and HTML then Publish
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

function ff_mlx2htmlpdf_runandexport(varargin)

%% Default Parameters

% Input Folder
root = 'c:';
user = 'Users/fan/Documents/Dropbox (UH-ECON)/repos/PrjUWSaveFric';
project = 'udupawangsave/udupawangsave/vig';
st_proj_folder = fullfile(root, user, project);

% Select possibly from multiple subfolders
cl_st_subfolder = {'ds_amin/'};
st_file_name_mlx = '*.mlx';

% output folder
st_out_folder = 'C:/Users/fan/Documents/Dropbox (UH-ECON)/UdupaWangSavingsFric/ModelVig/20190718/ds_amin';

% Search 
st_pub_format = 'html';
bl_run_mlx = true;

cl_params = {st_proj_folder cl_st_subfolder st_out_folder ...
    st_file_name_mlx ...
    st_pub_format bl_run_mlx};

%% Parse Parameters

[cl_params{1:length(varargin)}] = varargin{:};

st_proj_folder = cl_params{1};
cl_st_subfolder = cl_params{2};
st_out_folder = cl_params{3};
st_file_name_mlx = cl_params{4};
st_pub_format = cl_params{5};
bl_run_mlx = cl_params{6};

%% Add Path
% set up path components

addpath(genpath(st_proj_folder));

%% Search Files
% generate html publish document

[cl_st_file_names, cl_st_folder_names] = ...
    ff_find_files(st_proj_folder, cl_st_subfolder, st_file_name_mlx);

% %% Test Single Conversion
% cd C:/Users/fan/Math4Econ/matrix_application
% matlab.internal.liveeditor.openAndConvert('KL_borrowhire_firm.mlx', 'KL_borrowhire_firm.tex')

%% Publish Files
% generate html for each file

for it_file_ctr = 1:length(cl_st_file_names)

    % get file name and path
    st_file_name_mlx = cl_st_file_names{it_file_ctr};
    file_folder = cl_st_folder_names{it_file_ctr};
    
    % run MLX
    st_file_full_mlx = fullfile(file_folder, st_file_name_mlx);    
    if (bl_run_mlx)
        matlab.internal.liveeditor.executeAndSave(st_file_full_mlx);
    end
    
    % Generate .m file names    
    at_st_split_file_name = split(st_file_name_mlx, ".");
    st_file_name_m = strcat(at_st_split_file_name{1}, '_m.m');
    st_file_name_html = strcat(at_st_split_file_name{1}, '.html');
    st_file_name_pdf = strcat(at_st_split_file_name{1}, '.pdf');
    st_file_name_tex = strcat(at_st_split_file_name{1}, '.tex');

    % get full path to .m and .mlx
    st_file_full_m = fullfile(st_out_folder, st_file_name_m);
    st_file_full_html = fullfile(st_out_folder, st_file_name_html);
    st_file_full_pdf = fullfile(st_out_folder, st_file_name_pdf);
    st_file_full_tex = fullfile(st_out_folder, st_file_name_tex);
%     disp(st_file_name_mlx);
%     disp(st_file_name_m);
%     disp(st_file_full_tex);

    if (strcmp(st_pub_format, 'html'))
        % convert from .mlx to .html
        matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_html)
        disp(st_file_full_html);
    elseif (strcmp(st_pub_format, 'pdf'))
        % convert from .mlx to .pdf
        matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_pdf)
        disp(st_file_full_pdf);
    end
    
%     % convert from .mlx to .m
%     matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_m)
%     % convert from .mlx to .tex
%     matlab.internal.liveeditor.openAndConvert(st_file_full_mlx, st_file_full_tex)

end
% delete(gcp('nocreate'));

end
