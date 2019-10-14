%% Matlab Array Reshape, Repeat and Expand Examples
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% Basic Examples of Reshape

a = [1,2,3,4,5,6]';
b = reshape(a, [3,2])
b(:)
a = [1,2,3;4,5,6;7,8,9;10,11,12]'
b = reshape(a, [6,2])
%% *Stack Two Matrix of Equal Column Count Together*

a = [1,2;3,4];
a_stacked = [a;a;a];
disp(a_stacked);
%% *Repeat/Duplicate Matrix Downwards*
% There is a 2 by 3 matrix, to be repeated 4 times, downwards. This is useful 
% for replicating data matrix for say counterfactual purposes.
% 
% Below, we have two ways of repeating a matrix downwards. Copy as whole, or 
% copy row by row. 

row_count = 2;
col_count = 3;
repeat_mat_count = 2;

data_vec = 1:(row_count*col_count);
searchMatrix = reshape(data_vec,row_count,col_count);

% To repeat matrix downwards
rep_rows_idx = [1:row_count]'*ones(1,repeat_mat_count);
rep_rows_idx = rep_rows_idx(:);

rep_cols_idx = [1:col_count];
rep_cols_idx = rep_cols_idx(:);

searchMatrixRep_stack = searchMatrix(rep_rows_idx, rep_cols_idx);

% To insert repeated rows following original rows
rep_rows_idx = ([1:row_count]'*ones(1,repeat_mat_count))';
rep_rows_idx = rep_rows_idx(:);

searchMatrixRep_dup = searchMatrix(rep_rows_idx, rep_cols_idx);

disp(searchMatrix)
disp(searchMatrixRep_stack)
disp(searchMatrixRep_dup)
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