mt_data = rand(3,10);
ar_st_colnames = ["col1", "col2", "col3", "col4"];

tb_from_mat = array2table(mt_data);

strcat('col', string(1:3))

%% Adjust Column Names
% if ar_st_colnames does not have sufficient column
[it_tb_row_cnt, it_tb_col_cnt] = size(tb_from_mat);
it_ar_st_colnames_cnt = length(ar_st_colnames);
if (it_ar_st_colnames_cnt < it_tb_col_cnt)
%     warning('Not enough column names specified');
%     warning(string(ar_st_colnames));
    ar_st_colnames_add = strcat('col', ...
        string(it_ar_st_colnames_cnt:1:it_tb_col_cnt));
    ar_st_colnames = [ar_st_colnames, ar_st_colnames_add];
elseif (it_ar_st_colnames_cnt > it_tb_col_cnt)
%     warning('Too many column names specified')
%     warning(string(ar_st_colnames));
    ar_st_colnames = ar_st_colnames(1:it_tb_col_cnt);
end

ar_st_colnames_add
ar_st_colnames
tb_from_mat.Properties.VariableNames = cellstr(ar_st_colnames);
