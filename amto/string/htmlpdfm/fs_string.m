%% Basic String Operations
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Combine String, Numeric values etc, Single and Double Quotes
% Convert a string array into a single string, note the double quotes, and the 
% auto space between:

st_a = "another string";
ar_st = ["abc", num2str(2), "opq", st_a];
disp(strjoin(ar_st));
%% 
% If we do not want to have spaces between words, the second parameter for strjoin 
% allows for string connectors:

st_a = "another string";
ar_st = ["abc", num2str(2), "opq", st_a];
disp(strjoin(ar_st, ""));
%% 
% With single quotes, the str element is not an array, so does not need strjoin, 
% but not need to have spaces:

st_a = 'another string';
str = ['abc ', num2str(2), ' opq ', st_a];
disp((str));
%% Construct String Array and String Elements of String Array
% In the example below, we have a number of strings we want to put inside a 
% string array, then join with strjoin, but two of the strings need to be constructed 
% as strings first. Note below that double quoates are own strings, single quotes 
% in brackets constructing additional strings. 

st_a = "another string";
ar_st = strjoin(...
    ["Completed SNW_DS_MAIN", ...
     ['SNW_MP_PARAM=' num2str(123.345)], ...
     ['SNW_MP_CONTROL=' num2str(678.90)], ...
     st_a...
    ], ";");
disp(ar_st);
%% Paste Join Strings Together with Separator
% Join strings together with separator, this is similar to the paste0 function 
% in R.

ar_st = ["abc", "efg", "opq"];
disp(strjoin(ar_st, '-'));
%% Combine Char with Numeric Value
% Compose a string with words and numerical values

st_title = strcat("Figure Title ", ...
    "(", ...
    "threedeci=%.3f,", ...
    "twodeci=%.2f,", ...
    "int=%.0f", ...
    ")");
ar_params = 123.4567 + zeros(1,3);
st_combo = compose(st_title, ar_params);
disp(st_combo);
%% Search if String Contains Substring
% Does string contain substring?

st_long1 = 'simu_dense';
st_long2 = 'simu_denser';
st_long3 = 'simuverydense';
st_long4 = 'simu_medium';
st_long5 = 'simuverysmall';
disp([contains(st_long1, 'dense'), contains(st_long2, 'dense'), contains(st_long3, 'dense'), ...
    contains(st_long4, 'dense'), contains(st_long5, 'dense')]);
%% Change File Name MLX to M

st_file_name_mlx = 'continuous_differentiable.mlx';
at_st_split_file_name = split(st_file_name_mlx, ".");
st_file_name_m = strcat(at_st_split_file_name{1}, '_m.m');
disp(st_file_name_m);