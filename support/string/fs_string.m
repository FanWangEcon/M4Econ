%% String: String Manipulations Matlab
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Duplicate String

it_duplicate_n = 10;
disp(repmat({'String'}, [1, it_duplicate_n]));

%% Combine Two Numeric Arrays to a Single String Array

ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
disp([num2str(ar_fl_abc1', 'zw=%3.2f;'), num2str(ar_fl_abc1', 'zr=%3.2f')]);

%% Convert Numeric Array to String, Apeend Prefix to all elements.

ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_st_wth_prefix = strcat('row=', string(ar_fl_abc1));
disp(ar_st_wth_prefix);

% Does Array Exist in Longer Array as Subset
ar_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_abc2 = [0.4 0.1 0.2 0.3 0.4];
ar_efg = [0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4];
st_abc1 = strjoin(string(num2str(ar_abc1)));
st_abc2 = strjoin(string(num2str(ar_abc2)));
st_efg = strjoin(string(num2str(ar_efg)));
contains(st_efg, st_abc1)
contains(st_efg, st_abc2)

% Display Convert to String
fprintf('Display string [%s]', num2str([1,2,3]));
fprintf('Display string [%s]', num2str(1.1));
fprintf('Display string [%s]', 'abc');

%% String Join to form Single Element
% using char() is safe

st_var_name = "abc"
st_var_name = [st_var_name ' percentile values']
strjoin(st_var_name)

st_var_name = "abc"
st_var_name = [char(st_var_name) ' percentile values']

st_var_name = 'abc'
st_var_name = [char(st_var_name) ' percentile values']

%% Numeric Array to String without Space
% String replace

ar_it_test_grp = [3, 8, 9];
strrep(num2str(ar_it_test_grp), '  ', '_')

%% Find position of String in String Cell

ls_st_param_key = {'fl_crra', 'fl_beta', ...
                   'fl_w', 'fl_r_save', ...
                   'fl_a_max', 'it_z_n', 'it_a_n'};
st_param_key = 'fl_a_max';
find(strcmp(ls_st_param_key, st_param_key))

%% Find the positions of String Cells in Full String Cells

ls_st_param_key = {'fl_crra', 'fl_beta', ...
                   'fl_w', 'fl_r_save', ...
                   'fl_a_max', 'it_z_n', 'it_a_n'};

cl_st_param_keys = {'fl_w', 'fl_beta', 'it_z_n'};

cell2mat(cellfun(@(m) find(strcmp(ls_st_param_key, m)), ...
                 cl_st_param_keys, 'UniformOutput', false))

find(strcmp(ls_st_param_key, st_param_key))

%% Cell to string Paste and Replace dash

cl_st_param_keys = {'fl_crra', 'fl_beta'};
display(strrep(strjoin(cl_st_param_keys, '-'), '_', '\_'));
