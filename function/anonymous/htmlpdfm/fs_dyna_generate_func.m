%% Dynamically Generate M Files
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Dynamically Generate and Run M Files
% Use-case: There is a wage equation that provides wage for college or non-college 
% educated indivdiuals. The parameter for college and non-college educated distinguishes 
% them with values 2 and 1. Initially, model was designed to be solved jointly 
% for college and non-college educated, so the education grid as both values 1 
% and 2. In modified code version, only one education group solved at once. The 
% education grid is always length 1. This wage education is called by many functions, 
% so do not want to change the parameter structure. Instead, depending on whether 
% low or high education group is been solved for, regenerate this function with 
% hard-coded values for education groups.
% 
% see <https://www.mathworks.com/matlabcentral/answers/407161-how-to-use-one-matlab-program-to-create-a-new-m-file-and-insert-executable-code-into-it-which-is-fr 
% this> and <https://www.mathworks.com/matlabcentral/answers/13077-error-with-dynamically-created-m-files 
% this>.
% 
% First cell array to store function code lines. 

cl_code = {'function F=fsi_test_wage(j,educ)', ...
	 '% both', ...
	 '%it_edu_grid_type = 1;', ...
	 '% non-college only', ...
	 '%it_edu_grid_type = 2;', ...
	 '% college only', ...
	 'it_edu_grid_type = 3;', ...
	 'if (it_edu_grid_type == 1 || it_edu_grid_type == 2)', ...
	 '    % no changes needed when both, or low education type', ...
	 '    % low type = 1, educ = 1', ...
	 '    F = fsi_test_wage_equa(j,educ);', ...
	 'elseif (it_edu_grid_type == 3)', ...
	 '    % problem high type, educ should equal 2, but solving for high edu only, educ=1', ...
	 '    F = fsi_test_wage_equa(j,1);', ...
	 'end', ...
	 'end'};
%% 
% Second, get current path.

% Check folder to use
spn_current_mlx_path = matlab.desktop.editor.getActiveFilename;
[spt_filepath, snm_name, st_ext] = fileparts(spn_current_mlx_path);
disp(['spt_filepath=' spt_filepath]);
spt_filepath = fullfile(spt_filepath, '_file');
if ~exist(spt_filepath, 'dir')
    mkdir(spt_filepath);
end
disp(['spt_filepath:' spt_filepath]);
%% 
% Third, generate file.

% Start file
spn_path_file = fullfile(spt_filepath, 'fsi_test_wage.m');
f = fopen(spn_path_file, 'w');
fprintf(f, '%s\n', cl_code{:});
fclose(f);
tmpfile;
%% 
% Third, add functions in subfolder to path.

% Add to path to matlab path
addpath(spt_filepath);
%% 
% Call and use function

wage = fsi_test_wage(19, 1);
disp(['wage:' num2str(wage)]);