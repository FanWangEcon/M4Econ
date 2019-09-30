%% Matlab Array Broadcast and Expansion Examples
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
% 
% Matrix broadcasting was added to matlab's recent editions. This is an important 
% step for vectorizing codes. Proper usage of broadcasting reduces memory allocation 
% requirements for matrix matrix operations.
%% Expand with Broadcast, Percentage Choice grids

clear all
ar_w_perc = [0.1,0.5,0.9]
ar_w_level = [-2,0,2]
fl_b_bd = -4
ar_k_max = ar_w_level - fl_b_bd
ar_ak_perc = [0.1,0.3,0.7,0.9]
mt_k = (ar_k_max'*ar_ak_perc)'
mt_a = (ar_w_level - mt_k)
%% Expand Matrix Twice

clear all
% Same as above
ar_w_level = [-2,-1,-0.1]
fl_b_bd = -4
ar_k_max = ar_w_level - fl_b_bd
ar_ak_perc = [0.001, 0.1,0.3,0.7,0.9, 0.999]
mt_k = (ar_k_max'*ar_ak_perc)'
mt_a = (ar_w_level - mt_k)

% fraction of borrowing for bridge loan
ar_coh_bridge_perc = [0, 0.5, 0.999];

% Expand matrix to include coh percentage dimension
mt_k = repmat(mt_k, [1, length(ar_coh_bridge_perc)])
mt_a = repmat(mt_a, [1, length(ar_coh_bridge_perc)])
mt_a = mt_a

% bridge loan component of borrowing
ar_brdige_a = (ar_coh_bridge_perc'*ar_w_level)'
ar_brdige_a = ar_brdige_a(:)'

% borrowing choices excluding bridge loan
mt_a_nobridge = mt_a - ar_brdige_a