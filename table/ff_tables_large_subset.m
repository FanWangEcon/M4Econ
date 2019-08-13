%% Given Row and Column Counts, Get Subset of Rows and Columns for Display
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Assets Repository>
% Table of Content.*

%%
function [ar_it_cols, ar_it_rows] = ff_tables_large_subset(varargin)
%% FFT_ROW_COL_SUBSET
%

%% Default
% use binomial as test case, z maps to binomial win prob, remember binom
% approximates normal.

if (isempty(varargin))

    clear all;
    close all;

    [it_col_n, it_col_n_keep, it_row_n, it_row_n_keep] ...
        = deal(100, 49, 37, 12);
    bl_display_addzero = true;

else

    [it_col_n, it_col_n_keep, it_row_n, it_row_n_keep] = varargin{:};
    bl_display_addzero = false;

end

%% Add in Zero

if (it_col_n >= it_col_n_keep)
    ar_it_cols = (1:1:round(it_col_n_keep/2));
    ar_it_cols = [ar_it_cols ((it_col_n)-round(it_col_n_keep/2)+1):1:(it_col_n)];
else
    ar_it_cols = 1:1:it_col_n;
end
ar_it_cols = unique(ar_it_cols);

if (it_row_n >= it_row_n_keep)
    ar_it_rows = (1:1:round(it_row_n_keep/2));
    ar_it_rows = [ar_it_rows ((it_row_n)-round(it_row_n_keep/2)+1):1:(it_row_n)];
else
    ar_it_rows = 1:1:it_row_n;
end
ar_it_rows = unique(ar_it_rows);


%% Display
if (bl_display_addzero)

    disp('ar_it_cols');
    disp(ar_it_cols);

    disp('ar_it_rows_iter');
    disp(ar_it_rows);

end
end
