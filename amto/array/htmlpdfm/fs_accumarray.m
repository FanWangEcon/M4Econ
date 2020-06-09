%% Accumarray Examples
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Accumarry Basic Example
% There are three unique values in ar_a, sum up the probabilities for each of 
% the unique states. This is equivalent to sorting a matrix with a and prob, and 
% computing sum for each.

ar_a = [3,2,1,3]';
ar_prob = [0.1,0.2,0.31,0.39]';
ar_sumprob = accumarray(ar_a, ar_prob);
tb_summed_prob = table(sort(unique(ar_a)), ar_sumprob);
disp(tb_summed_prob);
%% Accumarry For Discrete Random Variable 
% Upon solving a model, if we look for the mass at certain choices or states, 
% accumarray could help aggregate up probabilities

a1 = [1,1,2,2]
a2 = [3,2,1,3]
a3 = [1,2,3,3]

a = [a1;a2;a3]'/2

prob_a = zeros(size(a)) + 1/12
[ar_idx_full, ~, ar_idx_of_unique] = unique(a)
mt_idx_of_unique = reshape(ar_idx_of_unique, size(a))

accumarray(mt_idx_of_unique(:,1), prob_a(:,1))
accumarray(mt_idx_of_unique(:,2), prob_a(:,2))
accumarray(mt_idx_of_unique(:,3), prob_a(:,3))