% This fiel is for testing things out.

% Generate a 3 by 3 matrix of random values
rng(3);
it_row_n = 3;
it_col_n = 3;
mt_rhs = rand([it_row_n, it_col_n]);

% Generate true coefficients
ar_beta_true = rand([it_row_n, 1]);

% Generate LHS, given true parameter
ar_lhs = mt_rhs*ar_beta_true;

% OLS regression function
fc_ols_lin = @(y, x) (x'*x)^(-1)*(x'*y)

% Estimate
ar_beta_esti = fc_ols_lin(ar_lhs, mt_rhs);

% Display
tb_beta = array2table([ar_beta_true, ar_beta_esti]);
cl_col_names = ["beta true", "beta estimates"];
cl_row_names = strcat('row_coef_', string((1:it_row_n)));
tb_beta.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_beta.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);
disp(tb_beta);
