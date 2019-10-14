%% Matlab Array Index Slicing and Subsetting to Replace and Expand
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% Matlab Index based Replacement of Subset of Matrix Values

clear all;
close all;
rng(123);
randMatZ = rand(3,6)+1
randMat = rand(3,6)-0.5
 
output = max(-randMat,0)
randMatZ(output==0) = 999
min(randMatZ,[],2)
 
randMatZ((max(-randMat,0))==0) = 999
min(randMatZ,[],2)
%% Matlab Matrix Index Based Matrix Expansion (Manual)
% In the example below, we start with a 4 by 2 matrix, than we expand specific 
% rows and columns of the matrix. Specifically, we expand the matrix such that 
% the result matrix repeats the 1st, 2nd, 1st, 2nd, then 3rd, than 1st, 1st, and 
% 1st rows. And repeats column 1, then 2nd, then 2nd, then 2nd, and finally the 
% first column. 

% Original Matrix
Z = 2;
N = 2;
Q = 2;
base_mat = reshape(1:(Z*N*Q),Z*N,Q);
disp(base_mat);
% Expanded Matrix
base_expand = base_mat([1,2,1,2,3,1,1,1],[1,2,2,2,1]);
disp(base_expand);
%% Duplicate Matrix Downwards N times Using Index
% The example here has the same idea, but we do the operations above in a more 
% automated way. This could be done using alternative methods. 

% Original Matrix
Z = 2;
N = 2;
Q = 2;
base_mat = reshape(1:(Z*N*Q),Z*N,Q);
disp(base_mat);
% Generate row Index many times automatically depending on how many times
% to replicate
vmat_repeat_count = 3;
vmat_reindex_rows_repeat = [1:(Z*N)]'* ones(1,vmat_repeat_count);
vmat_reindex_rows_repeat = vmat_reindex_rows_repeat(:);
disp(vmat_reindex_rows_repeat');
% Duplicate Matrix by the Rows specified above, and using the same number
% of columns.
mat_repdown = base_mat(vmat_reindex_rows_repeat(:), 1:Q);
disp(mat_repdown');
%% Max of Matrix column by Column Linear to 2d Index
% Finding max of matrix column by column, then obtain the linear index associated 
% with the max values.

randMat = rand(5,3);
disp(randMat);
[maxVal maxIndex] = max(randMat);
linearIndex = sub2ind(size(randMat),maxIndex,(1:1:size(randMat,2)))
randMat(linearIndex)
t_pV = [1,2;3,4;5,6];
t_pV_Ind = [1,1;0,0;1,1];
[maxVal maxIndex] = max(t_pV(t_pV_Ind==1))
%% Given Array of size M, Select N somewhat equi-distance elements

% Subset count
it_n = 5;

% Example 1, long array
ar_fl_a = 1:1.1:100;
ar_it_subset_idx = unique(round(((0:1:(it_n-1))/(it_n-1))*(length(ar_fl_a)-1)+1));
ar_fl_a_subset = ar_fl_a(ar_it_subset_idx);
disp(ar_fl_a_subset);

% Example 2, Short Array
ar_fl_a = 1:1.1:3;
ar_it_subset_idx = unique(round(((0:1:(it_n-1))/(it_n-1))*(length(ar_fl_a)-1)+1));
ar_fl_a_subset = ar_fl_a(ar_it_subset_idx);
disp(ar_fl_a_subset);

% Write As function
f_subset = @(it_subset_n, it_ar_n) unique(round(((0:1:(it_subset_n-1))/(it_subset_n-1))*(it_ar_n-1)+1));

% Select 5 out of 10
disp(f_subset(5, 10));

% Select 10 out of 5
disp(f_subset(10, 5));

% Select 5 out of 5
disp(f_subset(5, 5));