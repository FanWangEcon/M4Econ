%% Accumarray examples
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% accumarry basic example

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
