%% Matlab Array Reshaping Examples
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% Basic Examples

a = [1,2,3,4,5,6]';
b = reshape(a, [3,2])
b(:)


a = [1,2,3;4,5,6;7,8,9;10,11,12]'
b = reshape(a, [6,2])
%% Index Dimension Transform
% it_inner_fin = 5; it_outter_fin = 3;
% 
% it_inner_cur = it_outter_fin it_outter_cur = it_inner_fin
% 
% ar_it_cols_idx = 1:1:(it_inner_fin*it_outter_fin) ar_it_cols_inner_dim = repmat(1:it_inner_cur, 
% [it_outter_cur, 1]) ar_it_cols_inner_dim(:)'
% 
% mt_it_cols_idx = reshape(ar_it_cols_idx, [it_inner_cur, it_outter_cur])' mt_it_cols_idx(:)'

it_inner_fin = 5;
it_outter_fin = 3;

ar_it_cols_idx = 1:1:(it_inner_fin*it_outter_fin)
mt_it_cols_idx = reshape(ar_it_cols_idx, [it_outter_fin, it_inner_fin])'
mt_it_cols_idx(:)'