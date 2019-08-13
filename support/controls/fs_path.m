%% Matlab Path Generation
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Generate Platform Agnostic Path

root = 'c:';
user = 'Users/fan/';
project = '/M4Econ/';
subfolder = 'support////string';
file_name = 'fs_string.m';
f = fullfile(root, user, project, subfolder, file_name);

disp(f);

root = 'c';
user = 'fan';
project = 'M4Econ';
subfolder = 'support/string';
file_name = 'fs_string.m';
f = fullfile(root, user, project, subfolder, file_name);

disp(f);
