%% Matlab Path Generation
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*


%% Get all files from a folder

% Generate Folder String
root = 'c:';
user = 'Users/fan';
project = 'M4Econ';
subfolder = 'support/string/';
folder = fullfile(root, user, project, subfolder);

% get all files in Folder
sc_files = dir(folder);

% display
disp(sc_files)
sc_files.name

%% Get all m files from a folder

% Generate Folder String
root = 'c:';
user = 'Users/fan';
project = 'M4Econ';
subfolder = 'support/string/';
filename = '*.m';
folder = fullfile(root, user, project, subfolder, filename);

% get all files in Folder
sc_files = dir(folder);

% display
disp(sc_files)
sc_files.name

% display 
for it_ctr = 1:length(sc_files)
    disp(sc_files(it_ctr).name);
end

%% One Line Gen Dir if Does not Exist

% Generate Folder String
root = 'c:';
user = 'Users/fan/';
project = '/M4Econ/';
subfolder = 'support////string';
folder = fullfile(root, user, project, subfolder);

% Generate folder if does not already exist
if ~exist(folder,'dir'); mkdir(folder); end
