%% Publish Command for Multiple M Files
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Publish one file in a folder

% set up path components
root = 'c:';
user = 'Users/fan';
project = 'M4Econ';
subfolder = 'support\string';

% set up file name
file_name = 'fs_string.m';

% add folder to path
folder = fullfile(root, user, project, subfolder);
addpath(folder);

% generate html publish document
file = fullfile(root, user, project, subfolder, file_name);
f_html = publish(file, 'html');

% display path
disp(file);
disp(f_html);

% show file
web(f_html, '-browser');

%% Publish all m files in one folder

bl_show_browser = true;

% set up path components
root = 'c:';
user = 'Users/fan';
project = 'M4Econ';

subfolder = 'support/string';
subfolder = 'table';
subfolder = 'support/*/';

% set up file name
file_name = '*.m';
% file_name = '\*\*.m';
% '\*\*.m';

% add folder to path
folder = fullfile(root, user, project, subfolder);
addpath(folder);

% generate html publish document
file_wildcard = fullfile(root, user, project, subfolder, file_name);
sc_files = dir(file_wildcard);

% generate html for each file
% must use parfor, otherwise some functions clear all so will have bug,
% lose it_ctr, lose other after run publish
parfor it_ctr = 1:length(sc_files)
    
    % get file name and path
    file_name = sc_files(it_ctr).name;
    file_folder = sc_files(it_ctr).folder;
    file_full = fullfile(file_folder, file_name);
    
    % generate documentation
    f_html = publish(file_full, 'html');
    
    % display path
    disp(file_name);
    disp(f_html);
    
    % show in browser
    if (bl_show_browser)
        web(f_html, '-browser');
    end
end

%% Publish all m files in Code Dyna Asset Parfor

bl_show_browser = true;
bl_publish = true;

% set up path components
root = 'c:';
user = 'Users/fan';
project = 'CodeDynaAsset';

subfolder = 'tools';
subfolder = 'm_abz/test/ff_az_ds_vecsv/*/';
% subfolder = 'm_ipwkbzr/test/ff_ipwkbzr_ds_vecsv/*/';

% set up file name
file_name = '*.m';
% '\*\*.m';

% add folder to path
folder = fullfile(root, user, project, subfolder);

% generate html publish document
file_wildcard = fullfile(root, user, project, subfolder, file_name);
sc_files = dir(file_wildcard);

% generate html for each file
parfor it_ctr = 1:length(sc_files)
    
    % get file name and path
    file_name = sc_files(it_ctr).name;
    file_folder = sc_files(it_ctr).folder;
    file_full = fullfile(file_folder, file_name);
    
    % display path
    disp(file_name);
    
    % generate documentation
    if (bl_publish)
        f_html = publish(file_full, 'html');
        disp(f_html);
    end
    
    % show in browser
    if (bl_publish && bl_show_browser)
        web(f_html, '-browser');
    end
end
% delete(gcp('nocreate'));
