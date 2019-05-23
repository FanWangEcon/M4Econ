function [mt_c] =  ff_broadcast_mat(ar_cash_on_hand, ar_b_choice, ar_k_choice)
% Assume ar_b_choice and ar_k_choice are N by 1
% Assume ar_cash_on_hand and ar_k_choice are 1 by M
    mt_c = ar_cash_on_hand - ar_b_choice/(1+0.02) - ar_k_choice;
end
