% 2021-08-05 19:24
% Reusable grouping and aggregating code below, combine with some testable data.
for it_wgt_grp = [1, 2, 3]

    % 1. Select relevant variables
    if (it_wgt_grp == 1)
        st_logr_var = "gender";
        st_logr_top_val = "Male";
        st_logr_bottom_val = "Female";
        ar_st_grp_vars = ["year", st_logr_var, "occupation"];
        ar_st_cates_vars = [ar_st_grp_vars, "skill"];
        ar_st_final_vars = ["year", "occupation", "skill"];
        st_out_rela_var = "wagerela_model_sklwgted";
    elseif (it_wgt_grp == 2)
        st_logr_var = "gender";
        st_logr_top_val = "Male";
        st_logr_bottom_val = "Female";
        ar_st_grp_vars = ["year", st_logr_var, "skill"];
        ar_st_cates_vars = [ar_st_grp_vars, "occupation"];
        ar_st_final_vars = ["year", "skill", "occupation"];
        st_out_rela_var = "ln_wagerela_m2f_occwgted";
    elseif (it_wgt_grp == 3)
        st_logr_var = "skill";
        st_logr_top_val = "skilled";
        st_logr_bottom_val = "unskilled";
        ar_st_grp_vars = ["year", st_logr_var, "gender"];
        ar_st_cates_vars = [ar_st_grp_vars, "occupation"];
        ar_st_final_vars = ["year", "gender", "occupation"];
        st_out_rela_var = "ln_wagerela_k2u_occwgted";
    end

    % Excludes home-production
    tb_data_wrk = tb_data_pq(~matches(tb_data_pq.category, ar_st_category_home), [ar_st_cates_vars, st_q_var, st_p_var]);

    % 1. Aggregate worker count within group and keep remaining identifiers.
    tb_data_wrk_grp_q = groupsummary(tb_data_wrk(:, [ar_st_grp_vars, st_q_var]), ar_st_grp_vars, "sum");
    tb_data_wrk = join(tb_data_wrk, tb_data_wrk_grp_q);

    % 2. Shares
    tb_data_wrk{:, "q_shr_ingrp"} = tb_data_wrk{:, st_q_var}./tb_data_wrk{:, ['sum_' char(st_q_var)]};

    % 3. Wage weighted sum
    tb_data_wrk{:, "p_wgt_ingrp"} = tb_data_wrk{:, st_p_var}.*tb_data_wrk{:, "q_shr_ingrp"};
    tb_data_wrk_grp_q = groupsummary(tb_data_wrk(:, [ar_st_grp_vars, "p_wgt_ingrp"]), ar_st_grp_vars, "sum");
    tb_data_wrk = join(tb_data_wrk, tb_data_wrk_grp_q);

    % 4. Wage male and female or some other classification categories
    st_psklwgt_var = "sum_p_wgt_ingrp";
    tb_data_wrk_male = tb_data_wrk(strcmp(tb_data_wrk{:, st_logr_var}, st_logr_top_val), :);
    tb_data_wrk_male.Properties.VariableNames{st_psklwgt_var} = 'meanVarMale';
    tb_data_wrk_male = tb_data_wrk_male(:, [ar_st_final_vars, "meanVarMale"]);
    tb_data_wrk_female = tb_data_wrk(strcmp(tb_data_wrk{:, st_logr_var}, st_logr_bottom_val), :);
    tb_data_wrk_female.Properties.VariableNames{st_psklwgt_var} = 'meanVarFemale';
    tb_data_wrk_female = tb_data_wrk_female(:, [ar_st_final_vars, "meanVarFemale"]);
    tb_data_wrk_mfw = join(tb_data_wrk_male, tb_data_wrk_female);

    % 5. Relative Wage
    tb_data_wrk_mfw{:, st_out_rela_var} = ...
        log(tb_data_wrk_mfw.meanVarMale./tb_data_wrk_mfw.meanVarFemale);

    % 6. Merge back
    tb_data_pq = join(tb_data_pq, tb_data_wrk_mfw(:, [ar_st_final_vars, st_out_rela_var]));
end

% 2021-08-11 19:49
% Testing derivative with symbolic functions.
% Define symbols
syms a b c d x
% Define function
f_x = log((a*b^(1-x))/(1 + a*b^(1-x)));
% Take derivative with respect to x several times
df_dx = simplify(diff(f_x, x));
disp(df_dx);
disp(double(subs(df_dx, {a,b,x}, {1,2,0.5})));

% Redefine simplified version of function and differentiate, should return the same derivative
falt1_x = log(1/((1/a)*(1/b)^(1-x) + 1));
dfalt1_dx = simplify(diff(falt1_x, x));
% Returning function looks a little different, but is actually the same thing
disp(dfalt1_dx);
% Returning values.
disp(double(subs(dfalt1_dx, {a,b,x}, {1,2,0.5})));

% Redefine the altnerative function one more time
falt2_x = log(1/(c*d^(1-x) + 1));
dfalt2_dx = simplify(diff(falt2_x, x));
% Returning function looks a little different, but is actually the same thing
disp(dfalt2_dx);
% Returning values.
disp(double(subs(dfalt2_dx, {c,d,x}, {1/1,1/2,0.5})));

% Second derivative and third derivative
disp(simplify(diff(f_x, x, 1)));
disp(simplify(diff(f_x, x, 1)));
disp(simplify(diff(f_x, x, 2)));
disp(simplify(diff(f_x, x, 3)));
disp(simplify(diff(f_x, x, 4)));
disp(simplify(diff(f_x, x, 5)));
disp(simplify(diff(f_x, x, 6)));
