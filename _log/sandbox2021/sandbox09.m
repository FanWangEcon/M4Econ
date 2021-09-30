%% 2021-09-30 10:04 Monthly vs Annual AR1
% There is a discrete AR(1) income process happening at the monthly level. However, we only observe aggregate information from the course of an entire year; no monthly data is available, but we know the total income from the year. What is the persistence in annual income from year to year?

% Suppose that there are 12 months in a year. We interpret the time-series just generated as the monthly time-series. We keep only all full 12 months data segments, dropping data from the last incomplete year. We reshape the vector of data to a matrix with 12 rows and some $M$ columns, and we compute the column sum in income.

% We regress monthly value on lagged monthly value, and also regress annual aggregate on lagged annual aggregate. What are the coefficients that we get? We will use the https://www.mathworks.com/help/stats/fitlm.html package. Synatx is similar to lm regression in R.

% A1. Cut from monthly series last incomplete year
it_month_per_year = 12;
ar_fl_monthly_series = ar_fl_time_series;
it_months = length(ar_fl_monthly_series);
it_years = floor(it_months/it_month_per_year);
it_mth_fullyr = it_month_per_year*it_years;
ar_fl_monthly_series_full_year = ar_fl_monthly_series(1:(it_mth_fullyr));
% A2. For testing purposes, suppose only observe average data every four years.
it_m48_per_year = 48;
ar_fl_m48ly_series = ar_fl_time_series;
it_m48s = length(ar_fl_m48ly_series);
it_4years = floor(it_m48s/it_m48_per_year);
it_mth_4yr = it_m48_per_year*it_4years;
ar_fl_m48ly_series_48m_year = ar_fl_m48ly_series(1:(it_mth_4yr));

% B1. Generate annualized (sum or average the same) statistics
mt_fl_monthly_series = reshape(ar_fl_monthly_series_full_year, [it_month_per_year, it_years]);
ar_fl_annual_mean_series = mean(mt_fl_monthly_series, 1);
% B2. Generate 48 month aggregate results
mt_fl_m48ly_series = reshape(ar_fl_m48ly_series_48m_year, [it_m48_per_year, it_4years]);
ar_fl_quadrennial_mean_series = mean(mt_fl_m48ly_series, 1);

% C. Generate the regression inputs for monthly and annualized data
% C1. monthly lagged and current
ar_fl_monthly_tcur = [ar_fl_monthly_series_full_year(2:it_mth_fullyr)];
ar_fl_monthly_tlag = [ar_fl_monthly_series_full_year(1:(it_mth_fullyr-1))];
tb_monthly_ar1 = table(ar_fl_monthly_tcur', ar_fl_monthly_tlag');
cl_col_names = {'y_mth_t', 'y_mth_t_lag'};
cl_row_names = strcat('mth_', string((2:(it_mth_fullyr))));
tb_monthly_ar1.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_monthly_ar1. Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

% C2. annual lagged and current
ar_fl_annual_tcur = [ar_fl_annual_mean_series(2:it_years)];
ar_fl_annual_tlag = [ar_fl_annual_mean_series(1:(it_years-1))];
tb_annual_ar1 = table(ar_fl_annual_tcur', ar_fl_annual_tlag');
cl_col_names = {'y_annual_t', 'y_annual_t_lag'};
cl_row_names = strcat('year_', string((2:(it_years))));
tb_annual_ar1.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_annual_ar1.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

% C3. every 4 year info
ar_fl_quadrennial_tcur = [ar_fl_quadrennial_mean_series(2:it_4years)];
ar_fl_quadrennial_tlag = [ar_fl_quadrennial_mean_series(1:(it_4years-1))];
tb_quadrennial_ar1 = table(ar_fl_quadrennial_tcur', ar_fl_quadrennial_tlag');
cl_col_names = {'y_quadrennial_t', 'y_quadrennial_t_lag'};
cl_row_names = strcat('4year_', string((2:(it_4years))));
tb_quadrennial_ar1.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_quadrennial_ar1.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

% D. Linear regress of current on lagged time-series
res_lm_monthly = fitlm(tb_monthly_ar1, 'y_mth_t~y_mth_t_lag');
disp(res_lm_monthly);
res_lm_annual = fitlm(tb_annual_ar1, 'y_annual_t~y_annual_t_lag');
disp(res_lm_annual);
res_lm_quadrennial = fitlm(tb_quadrennial_ar1, 'y_quadrennial_t~y_quadrennial_t_lag');
disp(res_lm_quadrennial);
