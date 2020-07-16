%% Array Index Slicing and Subsetting to Replace and Expand
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% Index Select Rows and Columns of a 2D matrix
% In the example below, select by entire rows and columns:

% There is a 2D Matrix
rng(123);
randMatZ = rand(3,6);
disp(randMatZ);
% Duplicate Select Row sand Columns of Elements
disp(randMatZ([1,2,3,3,3,2], [1,1,2,2,2,1]))
%% Index Select Set of Elements from 2D matrix
% Rather than selecting entire rows and columns, suppose we want to select only 
% one element at row 1 col 2, the element at row 2 col 4, element at row 5 col 
% 1, etc.

% Select Subset of Elements
it_row_idx = [1,2,3,1,3,2];
it_col_idx = [1,1,5,4,2,3];
% Select sub2idx
ar_lin_idx = sub2ind(size(randMatZ), it_row_idx, it_col_idx);
ar_sel_val = randMatZ(ar_lin_idx);
disp(ar_sel_val');
%% Find Closest Element of Array to Each Element of Another Array
% Given scalar value, find the cloest value in array:

fl_a = 3.4;
ar_bb = [1,2,3,4];
[fl_min, it_min_idx] = min(abs(ar_bb-fl_a));
disp(it_min_idx);
%% 
% Given a scalar value and an array, find the closest smaller value in the array 
% to the scalar value:

fl_a = 2.1;
ar_bb = [1,2,3,4];
disp(sum(ar_bb<fl_a));
%% 
% Array A is between 0  and 1, on some grid. Array B is also between 0 and 1, 
% but scattered. Find for each element of B the index of the cloest value on A 
% that is smaller than the element in B.

rng(1234);
ar_a = linspace(0,10,5);
ar_b = rand([5,1])*10;
mt_a_less_b = ar_a<ar_b;
mt_a_less_b_idx = sum(ar_a<ar_b, 2);
disp(ar_a);
disp(ar_b);
disp(mt_a_less_b);
disp(mt_a_less_b_idx);
%% Matlab Index based Replacement of Subset of Matrix Values

rng(123);
randMatZ = rand(3,6)+1;
randMat = rand(3,6)-0.5;
 
output = max(-randMat,0);
randMatZ(output==0) = 999;
min(randMatZ,[],2);
 randMatZ((max(-randMat,0))==0) = 999;
disp(randMatZ);
disp(min(randMatZ,[],2));
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
%% Given ND Array, Get Row and Column (and other dimension) Index With Value Conditioning
% There is a matrix where some values are equal to 1 (based on some prior selection), 
% get the row and column index of the matrix. 

% Some matrix with 1s
rng(123);
mt_some_ones = rand(3,3);
disp(mt_some_ones);
% find the location of the ones
[r_idx, c_idx] = find(mt_some_ones<0.5);
% the set of locations
disp([r_idx,c_idx]);
%% 
% Now do the same three with a three dimensional array:

% Some matrix with 1s
rng(123);
mn3_some_ones = rand(3,3,3);
disp(mn3_some_ones);
% find the location of the ones
[d1_idx, d2_idx, d3_idx] = ind2sub(size(mn3_some_ones), find(mn3_some_ones<0.5));
% the set of locations
disp([d1_idx, d2_idx, d3_idx]);
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