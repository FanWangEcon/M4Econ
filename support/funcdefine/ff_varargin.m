% This is an example of how to use varargin:
% 1. includes array matrix
% 2. includes array
% 3. includes scalar
% 4. includes string
% 5. includes cell array

function [tb_from_mat] = ff_mat2tab(varargin)

%% Catch Error
optional_params_len = length(varargin);
if optional_params_len > 5
    error('ff_mat2tab:TooManyOptionalParameters', ...
          'allows at most 5 optional parameters');
end

%% Default Folder Parameters
% by default all go to Sandbox folder with sub folders by dates
mt_data_default = rand(3,4);
% String array requires double quotes
ar_st_colnames_default = ["col1", "col2", "col3", "col4"];
ar_st_rownames_default = ["row1", "row2", "row3", "row4"];
% Others
st_table_name_default = "Table Name";
it_table_ctr_default = 1021;
optional_params = {mt_data_default ar_st_colnames_default ar_st_rownames_default ...
                   st_table_name_default it_table_ctr_default};

%% Parse Parameters
% numvarargs is the number of varagin inputted
[optional_params{1:optional_params_len}] = varargin{:};
% cell2mat(optional_params(1)) works with array
mt_data = cell2mat(optional_params(1));
% The structure below works with cell array
ar_st_colnames = optional_params{2};
ar_st_rownames = optional_params{3};
% Others
st_table_name = optional_params{4};
it_table_ctr = optional_params{5};

% Build Basic Matlab Table
% Suppose we want to store matrix results in a table,
% there are Q columns and N rows, The Q columns each is a different variable.
mt_data
ar_st_colnames
ar_st_rownames
st_table_name
it_table_ctr

end
