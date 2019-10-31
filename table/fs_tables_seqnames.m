%% Matlab Tables Sort and Order
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/
% *Dynamic Asset*>* Repository.*

%% Named Columns, Shock Rows

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Borrow R Shock: ar_z_r_borr_mesh_wage');
disp('Prod/Wage Shock: mt_z_wage_mesh_r_borr');
disp('show which shock is inner and which is outter');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

tb_two_shocks = array2table([ar_z_r_borr_mesh_wage;...
                              ar_z_wage_mesh_r_borr]');

cl_col_names = ["Borrow R Shock (Meshed)", "Wage R Shock (Meshed)"];
cl_row_names = strcat('zi=', string((1:length(ar_z_r_borr_mesh_wage))));

tb_two_shocks.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_two_shocks.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_two_shocks));
disp(head(tb_two_shocks, 20));
disp(tail(tb_two_shocks, 20));
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

%% More Examples

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Wage Prod Shock Transition Matrix: mt_z_r_borr_prob_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
it_col_n_keep = 15;
it_row_n_keep = 15;
[it_row_n, it_col_n] = size(mt_z_wage_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_wage', 'w%3.2f')]);
tb_z_wage_trans = array2table(round(mt_z_wage_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('zi=', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('zi=', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_rows));
tb_z_wage_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_z_wage_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_z_wage_trans));
disp(tb_z_wage_trans);
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Full Transition Matrix: mt_z_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
it_col_n_keep = it_z_wage_n*3;
it_row_n_keep = it_z_wage_n*3;
[it_row_n, it_col_n] = size(mt_z_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage_w1r2', 'r%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr_w1r2', 'w%3.2f')]);
tb_mt_z_trans = array2table(round(mt_z_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('i', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('i', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_rows));
tb_mt_z_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_mt_z_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_mt_z_trans));
disp(tb_mt_z_trans);
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

%% Sequence Name Subsetting

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Full Transition Matrix: mt_z_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

[it_row_n, it_col_n] = size(mt_z_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage', 'zr=%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr', 'zw=%3.2f')]);
tb_mt_z_trans = array2table(round(mt_z_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('zi=', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('zi=', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_cols));
tb_mt_z_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_mt_z_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_mt_z_trans));
disp(tb_mt_z_trans);
