%% Root and path

% set up path components
root = 'c:';
user = 'Users/fan';
project = 'M4Econ';
folder = fullfile(root, user, project);

% followed by code directory indicator
rmpath(genpath(folder))
addpath(genpath(folder))

%% Publish Pages

bl_publish = false;
bl_show_browser = false;

% Loop over folder structure
for it_fld_type = 1:4
    
    disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    
    if (it_fld_type == 1)
        subfolder = '\*\';
        disp('xxx 1st level folder')
    elseif (it_fld_type == 2)
        subfolder = '\*\*\';
        disp('xxx 2nd level folder')
    elseif (it_fld_type == 3)
        subfolder = '\*\*\*\';
        disp('xxx 3rd level folder')
    elseif (it_fld_type == 4)
        subfolder = '\*\*\*\*\';
        disp('xxx 4th level folder')
    end

    % set up file name
    file_name = '*.m';
    % '\*\*.m';

    % add folder to path
    folder = fullfile(root, user, project, subfolder);

    % generate html publish document
    file_wildcard = fullfile(root, user, project, subfolder, file_name);
    sc_files = dir(file_wildcard);

    % generate html for each file
    for it_ctr = 1:length(sc_files)

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
        if (bl_show_browser && bl_publish)
            web(f_html, '-browser');
        end
    end
end