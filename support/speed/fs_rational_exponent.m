
clear all;
st_single_double = 'single';
bl_show_fig = false;
z = 15;
iter = 50;

it_rown = 300 % 4GB if 1000
it_coln = round(((it_rown-1)*it_rown)/2 + it_rown);

c_min = 0.01;
c_max = 60;
tic;
mt_c = rand([it_rown*it_coln,1])*(c_max - c_min) + c_min;
mt_c = sort(mt_c);

if (strcmp(st_single_double, 'single'))
    mt_c = single(mt_c);
end
toc;

whos

% Define Function Handle
fl_crra = 1.5;
if (strcmp(st_single_double, 'single'))
    fl_crra = single(fl_crra);
end
fu_c = @(c) (((c).^(1-fl_crra)-1)./(1-fl_crra));
fu_c_fixed = @() fu_c(mt_c);

% Compute Time Cost
fl_t_direct_eval = timeit(fu_c_fixed);
ar_fl_compute_t(1) = fl_t_direct_eval;
ar_cl_method_names{1} = 'Direct Evaluation';

% C array
fl_mt_c_min = min(mt_c, [], 'all');
fl_mt_c_max = max(mt_c, [], 'all');
it_max_n = (fl_mt_c_max-fl_mt_c_min)/(10^-3);
it_interp_points = min(it_rown*it_coln, it_max_n)

ar_fl_c_grid = linspace(fl_mt_c_min, fl_mt_c_max, min(it_rown*it_coln, it_max_n));
if (strcmp(st_single_double, 'single'))
    ar_fl_c_grid = single(ar_fl_c_grid);
end
fl_ar_c_grid_gap = ar_fl_c_grid(2) - ar_fl_c_grid(1);
disp(length(ar_fl_c_grid))
disp(ar_fl_c_grid(2) - ar_fl_c_grid(1))

% Evaluate
ar_fl_u_at_c_grid = fu_c(ar_fl_c_grid);
% Interpolation Evaluator
fu_interp_near_c_fixed = @() interp1(ar_fl_c_grid, ar_fl_u_at_c_grid, mt_c, 'nearest');
fu_interp_linr_c_fixed = @() interp1(ar_fl_c_grid, ar_fl_u_at_c_grid, mt_c, 'linear');

% Compute Time Cost
fl_time_interp_near = timeit(fu_interp_near_c_fixed);
disp(fl_time_interp_near)
disp(fl_time_interp_near*z*iter)
ar_fl_compute_t(2) = fl_time_interp_near;
ar_cl_method_names{2} = 'interp1d nearest';

fl_time_interp_linr = timeit(fu_interp_linr_c_fixed);
disp(fl_time_interp_linr)
disp(fl_time_interp_linr*z*iter)
ar_fl_compute_t(3) = fl_time_interp_linr;
ar_cl_method_names{3} = 'interp1d linear';

% Interpolation Evaluator
fu_interp_near_dflt = @() interp1(ar_fl_u_at_c_grid, (((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1), 'nearest');
fu_interp_linr_dflt = @() interp1(ar_fl_u_at_c_grid, (((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1), 'linear');

% Compute Time Cost
fl_time_interp_near_dflt = timeit(fu_interp_near_dflt);
disp(fl_time_interp_near_dflt)
disp(fl_time_interp_near_dflt*z*iter)
ar_fl_compute_t(4) = fl_time_interp_near_dflt;
ar_cl_method_names{4} = 'interp1d nearest default grid';

fl_time_interp_linr_dflt = timeit(fu_interp_linr_dflt);
disp(fl_time_interp_linr_dflt)
disp(fl_time_interp_linr_dflt*z*iter)
ar_fl_compute_t(5) = fl_time_interp_linr_dflt;
ar_cl_method_names{5} = 'interp1d linear default grid';

% Get Quotient
fix((mt_c-min(mt_c, [], 'all'))./fl_ar_c_grid_gap) + 1;
fl_mt_c_min = min(mt_c, [], 'all');

f_divide = @() (((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1);
fl_time_divide = timeit(f_divide);
disp(fl_time_divide)
disp(fl_time_divide*z*iter)
ar_fl_compute_t(6) = fl_time_divide;
ar_cl_method_names{6} = 'fan index divide integer';

f_round = @() (fix((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1);
fl_time_round = timeit(f_round);
disp(fl_time_round)
disp(fl_time_round*z*iter)
ar_fl_compute_t(7) = fl_time_round;
ar_cl_method_names{7} = 'fan index round integer';

fu_interp_near_c_idx_fixed = @() ar_fl_u_at_c_grid(fix((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1);
fu_interp_near_c_rnd_fixed = @() ar_fl_u_at_c_grid(round((mt_c-fl_mt_c_min)./fl_ar_c_grid_gap) + 1);

% Compute Time Cost
fl_time_interp_near_idx = timeit(fu_interp_near_c_idx_fixed);
disp(fl_time_interp_near_idx)
disp(fl_time_interp_near_idx*z*iter)
ar_fl_compute_t(8) = fl_time_interp_near_idx;
ar_cl_method_names{8} = 'fan index interp fix';

% Compute Time Cost
fl_time_interp_near_rnd = timeit(fu_interp_near_c_rnd_fixed);
disp(fl_time_interp_near_rnd)
disp(fl_time_interp_near_rnd*z*iter)
ar_fl_compute_t(9) = fl_time_interp_near_idx;
ar_cl_method_names{9} = 'fan index interp round';

fu_interp_near_c_rnd_dflt = @() ar_fl_u_at_c_grid(round(mt_c)+1);

% Compute Time Cost
fl_time_interp_rnd_dflt = timeit(fu_interp_near_c_rnd_dflt);
disp(fl_time_interp_rnd_dflt)
disp(fl_time_interp_rnd_dflt*z*iter)
ar_fl_compute_t(10) = fl_time_interp_rnd_dflt;
ar_cl_method_names{10} = 'fan index interp round default grid';

% Generate Interpolant
ar_fl_u_at_c_grid = fu_c(ar_fl_c_grid);
f_grid_interpolant_near = griddedInterpolant(ar_fl_c_grid, ar_fl_u_at_c_grid, 'nearest')
f_grid_interpolant_linr = griddedInterpolant(ar_fl_c_grid, ar_fl_u_at_c_grid, 'linear')
f_grid_interpolant_spln = griddedInterpolant(ar_fl_c_grid, ar_fl_u_at_c_grid, 'spline')

% Interpolation Evaluator
fu_interp_gridded_near = @() f_grid_interpolant_near(mt_c);
fu_interp_gridded_linr = @() f_grid_interpolant_linr(mt_c);
fu_interp_gridded_spln = @() f_grid_interpolant_spln(mt_c);

% Compute Time Cost
fl_time_gridded_near = timeit(fu_interp_gridded_near);
disp(fl_time_gridded_near)
disp(fl_time_gridded_near*z*iter)
ar_fl_compute_t(11) = fl_time_gridded_near;
ar_cl_method_names{11} = 'griddedInterpolant nearest';

% Compute Time Cost
fl_time_gridded_linr = timeit(fu_interp_gridded_linr);
disp(fl_time_gridded_linr)
disp(fl_time_gridded_linr*z*iter)
ar_fl_compute_t(12) = fl_time_gridded_linr;
ar_cl_method_names{12} = 'griddedInterpolant linear';

% Compute Time Cost
fl_time_gridded_spln = timeit(fu_interp_gridded_spln);
disp(fl_time_gridded_spln)
disp(fl_time_gridded_spln*z*iter)
ar_fl_compute_t(13) = fl_time_gridded_spln;
ar_cl_method_names{13} = 'griddedInterpolant spline';

% Load Packages
rmpath(genpath('C:/Users/fan/M4Econ/external/splinterp/'))
addpath(genpath('C:/Users/fan/M4Econ/external/splinterp/'))

% Interpolation Evaluator
if (strcmp(st_single_double, 'single'))
    %     can not run splinterp if single
else
    fu_splinterp_fixed = @() splinterp1(ar_fl_u_at_c_grid, mt_c(:));
    % Compute Time Cost
    fl_time_splinterp = timeit(fu_splinterp_fixed);
    disp(fl_time_splinterp)
    disp(fl_time_splinterp*z*iter)
    ar_fl_compute_t(14) = fl_time_splinterp;
    ar_cl_method_names{14} = 'splinterp default grid';    
end

% Interpolation Evaluator
if (strcmp(st_single_double, 'single'))
    %     can not run splinterp if single
else
    fu_splinterp_dvd = @() splinterp1(ar_fl_u_at_c_grid, (((mt_c(:)-fl_mt_c_min)./fl_ar_c_grid_gap) + 1));
    % Compute Time Cost
    fl_time_splinterp_dvd = timeit(fu_splinterp_dvd);
    disp(fl_time_splinterp_dvd)
    disp(fl_time_splinterp_dvd*z*iter)
    ar_fl_compute_t(15) = fl_time_splinterp_dvd;
    ar_cl_method_names{15} = 'splinterp default grid c/divide';
end

tb_fl_compute_t = array2table([ar_fl_compute_t', ar_fl_compute_t'*z*iter]);
tb_fl_compute_t.Properties.RowNames = ar_cl_method_names;
tb_fl_compute_t.Properties.VariableNames = {'speedmat', 'speedfull'};
disp(tb_fl_compute_t);

if (bl_show_fig)
    fl_fu_c_fixed = fu_c_fixed();
    ar_interp_gridded_near = fu_interp_gridded_near();
    ar_interp_gridded_linr = f_grid_interpolant_linr();
    ar_interp_gridded_spln = fu_interp_gridded_spln();

    figure('PaperPosition', [0 0 15 15]);

    for sub_j=1:1:4    
        subplot(2,2,sub_j)
        hold on;

        if (sub_j == 1) 
            ar_divide_by = 0;
        else
            ar_divide_by = fl_fu_c_fixed(:);
        end

        g1 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_near(:)-ar_divide_by, 30, 'filled');
        g2 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_linr(:)-ar_divide_by, 30, 'filled');
        g3 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_spln(:)-ar_divide_by, 30, 'filled');
        legend([g1, g2, g3], {'near','linear','spline'}, 'Location','northwest',...
                'NumColumns',1,'FontSize',12,'TextColor','black');        

        if (sub_j == 1)             
            hline = refline([1 0]);
            hline.Color = 'k';
            hline.LineStyle = ':';
            hline.HandleVisibility = 'off';
            ylabel('Actual Utility Evaluated at c')
        else
            yline0 = yline(0);
            yline0.HandleVisibility = 'off';
            yline1 = yline(0.1);
            yline1.HandleVisibility = 'off';
            yline2 = yline(-0.1);
            yline2.HandleVisibility = 'off';
            ylabel('INterpolated/Actual Utility')

            if (sub_j == 3) 
                ylim([-0.1, 0.1])
            end
            if (sub_j == 4) 
                ylim([-0.01, 0.01])
            end        
        end

        grid on;
        grid minor;

        title(sprintf('griddedInterpolant comparison, crra utility approximation, interp grid n=%d', it_interp_points))

        xlabel('Approximated Util based on  Interpolation')
    end
end
