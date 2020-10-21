%% String Manipulations with Arrays
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% String Array
% Three title lines, with double quotes:

ar_st_titles = ["Title1","Title2","Title3"]';
disp(ar_st_titles);
%% 
% Three words, joined together, now single quotes, this creates one string, 
% rather than a string array:

st_titles = ['Title1','Title2','Title3'];
disp(st_titles);
%% String Cell Array
% Create a string array:

ar_st_title_one = {'Title One Line'};
ar_st_titles = {'Title1','Title2','Title3'};
disp(ar_st_title_one);
disp(ar_st_titles);
%% 
% Add to a string array:

ar_st_titles{4} = 'Title4';
disp(ar_st_titles);
%% 
% Update one of the strings:

ar_st_title_one{1} = strcat('log(', ar_st_title_one{1},')');
ar_st_titles{1} = strcat('log(', ar_st_titles{1},')');
disp(ar_st_title_one);
disp(ar_st_titles);
%% Joint String Cell Array with Suffix

ar_st_titles = {'Title1','Title2','Title3'};
disp(strcat(ar_st_titles, '_init'));
%% Duplicate String

it_duplicate_n = 10;
disp(repmat({'String'}, [1, it_duplicate_n]));
%% String Join to form Single Element
% using char() is safe

st_var_name = "abc"
st_var_name = [st_var_name ' percentile values']
strjoin(st_var_name)

st_var_name = "abc"
st_var_name = [char(st_var_name) ' percentile values']

st_var_name = 'abc'
st_var_name = [char(st_var_name) ' percentile values']
%% String Join dash (Paste)
% This is similar to R's paste function:

st_var_name = "abc";
st_var_name = [st_var_name, 'efg', 'mqo'];
disp(strjoin(st_var_name, "_"));
disp(strjoin(st_var_name, ","));
%% Numeric Array to String without Space
% String replace

ar_it_test_grp = [3, 8, 9];
strrep(num2str(ar_it_test_grp), '  ', '_')
%% Substring replace in Cell Array

ar_st_cells = {'shock=0.35','shock=0.40','shock=0.46'};
ar_st_updated_cells = strrep(ar_st_cells, 'shock', '$\epsilon$');
disp(ar_st_updated_cells);
%% Find position of String in String Cell

ls_st_param_key = {'fl_crra', 'fl_beta', ...
                   'fl_w', 'fl_r_save', ...
                   'fl_a_max', 'it_z_n', 'it_a_n'};
st_param_key = 'fl_a_max';
find(strcmp(ls_st_param_key, st_param_key))
%% Find the positions of String Cells in Full String Cells
% Find the positions of fl_w, fl_beta, and it_z_n in ls_st_param_key. Then just 
% find the position of fl_crra. When looking for the position of something that 
% does not exist, generate an find outcome array of length 0.

ls_st_param_key = {'fl_crra', 'fl_beta', ...
                   'fl_w', 'fl_r_save', ...
                   'fl_a_max', 'it_z_n', 'it_a_n'};

cl_st_param_keys = {'fl_w', 'fl_beta', 'it_z_n'};

cell2mat(cellfun(@(m) find(strcmp(ls_st_param_key, m)), ...
                 cl_st_param_keys, 'UniformOutput', false))
find(strcmp(ls_st_param_key, 'fl_crra'))
length(find(strcmp(ls_st_param_key, 'fl_crra_not_exist')))
~sum(strcmp(ls_st_param_key, 'fl_crra_not_exist'))
%% Cell to string Paste and Replace dash

cl_st_param_keys = {'fl_crra', 'fl_beta'};
display(strrep(strjoin(cl_st_param_keys, '-'), '_', '\_'));