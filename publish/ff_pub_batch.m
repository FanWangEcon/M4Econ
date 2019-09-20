%% Publish Command for Multiple M Files
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

function ff_pub_batch(varargin)

%% Default Parameters
% assume CodeDynaAsset is on the root folder 

root = 'c:';
user = 'Users/fan';
project = 'CodeDynaAsset';
st_proj_folder = fullfile(root, user, project);

% subfolder = 'm_abz/test/ff_az_ds_vecsv/*/';
cl_st_subfolder = {'m_az/solve/', 'm_abz/solve/', 'm_ipwkz/solve/', 'm_ipwkbzr/solve/'};
st_file_search_name = '*vecsv.m';

st_pub_format = 'html';
bl_show_browser = true;
bl_publish = true;

cl_params = {st_proj_folder cl_st_subfolder st_file_search_name ...
                st_pub_format bl_show_browser bl_publish};

%% Parse Parameters

[cl_params{1:length(varargin)}] = varargin{:};

st_proj_folder = cl_params{1};
cl_st_subfolder = cl_params{2};
st_file_search_name = cl_params{3};
st_pub_format = cl_params{4};
bl_show_browser = cl_params{5};
bl_publish = cl_params{6};

%% Add Path
% set up path components

addpath(genpath(st_proj_folder));

%% Search Files
% generate html publish document

[cl_st_file_names, cl_st_folder_names] = ...
    ff_find_files(st_proj_folder, cl_st_subfolder, st_file_search_name);

%% Publish Files

% generate html for each file
parfor it_file_ctr = 1:length(cl_st_file_names)
    
    % get file name and path
    st_file_search_name = cl_st_file_names{it_file_ctr};
    file_folder = cl_st_folder_names{it_file_ctr};
    file_full = fullfile(file_folder, st_file_search_name);
    
    % display path
    disp(st_file_search_name);
    
    % generate documentation
    if (bl_publish)
        f_html = publish(file_full, st_pub_format);
        disp(f_html);
    end
    
    % show in browser
    if (bl_publish && bl_show_browser)
        web(f_html, '-browser');
    end
end
% delete(gcp('nocreate'));

end

