%% Joint Log and Lin Grids
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/
% *Dynamic Asset*>* Repository.*

%%
function [ar_a] = ff_grid_loglin(it_a_vec_n, fl_amax, fl_amin, fl_loglin_threshold)
%% FF_GRID_LOGLIN generates lin+log grid
% Returns asset vector given certain parameters
% @param it_a_vec integer length of returned vector
% @param fl_amax float max value of the returned vector
% @param fl_amin float min value of the returned vector
% @param fl_loglin_threshold float threshold until which we need additional log space
% betweeen amin and threshold.

if (fl_amin >= 0)
    if (fl_amin >= fl_loglin_threshold)
        ar_a = [0 logspace(log10(fl_amin), log10(fl_amax), (it_a_vec_n - 1))]';
    else

        a_vec_n_log_cur = it_a_vec_n;
        a_vec_n_actual = it_a_vec_n + 9999;

        while (a_vec_n_actual >= it_a_vec_n)
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur);
            log_space_min_gap = avec_log(2) - avec_log(1);
            avec_lin = fl_amin:log_space_min_gap:fl_loglin_threshold;
            ar_a = unique([avec_lin';avec_log']);
            a_vec_n_actual = length(ar_a);
            a_vec_n_log_cur = a_vec_n_log_cur - 1;
        end

        ar_a = [0; ar_a];

        if (length(ar_a) == (it_a_vec_n-1))
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur+2);
            ar_a = [0; unique([avec_lin';avec_log'])];
        end

    end

    if (length(ar_a) == it_a_vec_n)
    else
        error('a_vec length (=%d) not equal to specified (should be = %d)', (length(ar_a)), (it_a_vec_n))
    end
else
    if (fl_amin >= fl_loglin_threshold)
        ar_a = [logspace(log10(fl_amin), log10(fl_amax), (it_a_vec_n))]';
    else

        a_vec_n_log_cur = it_a_vec_n;
        a_vec_n_actual = it_a_vec_n + 9999;

        while (a_vec_n_actual >= it_a_vec_n)
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur);
            log_space_min_gap = avec_log(2) - avec_log(1);
            avec_lin = fl_amin:log_space_min_gap:fl_loglin_threshold;
            ar_a = unique([avec_lin';avec_log']);
            a_vec_n_actual = length(ar_a);
            a_vec_n_log_cur = a_vec_n_log_cur - 1;
        end

        if (length(ar_a) == (it_a_vec_n-1))
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur+2);
            ar_a = unique([avec_lin';avec_log']);
        end
        if (length(ar_a) == (it_a_vec_n-2))
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur+3);
            ar_a = unique([avec_lin';avec_log']);
        end
        if (length(ar_a) == (it_a_vec_n-3))
            avec_log = logspace(log10(fl_loglin_threshold), log10(fl_amax), a_vec_n_log_cur+4);
            ar_a = unique([avec_lin';avec_log']);
        end

    end

    if (length(ar_a) == it_a_vec_n)
    else
        error('a_vec length (=%d) not equal to specified (should be = %d)', (length(ar_a)), (it_a_vec_n))
    end
end

end
