%% Maximum of Matrix Columns, Sort Matrix Columns
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Max Value from a Matrix
% Given a matrix of values, what is the maximum element, what are the row and 
% column indexes of this max element of the matrix. 

rng(123);
N = 3;
M = 4;
mt_rand = rand(M,N);
disp(mt_rand);
[max_val, max_idx] = max(mt_rand(:));
[max_row, max_col] = ind2sub(size(mt_rand), max_idx)
%% MAX Value from Each Column
% There is a matrix with N columns, and M rows, with numerical values. Generate 
% a table of sorted index, indicating in each column which row was the highest 
% in value, second highest, etc. (1) sort each column. (2) show the row number 
% from descending or ascending sort for each column as a matrix. 

% Create a 2D Array
rng(123);
N = 2;
M = 4;
mt_rand = rand(M,N);
disp(mt_rand);
%% 
% Use the maxk function to generate sorted index:

% maxk function
[val, idx] = max(mt_rand);
disp(val);
disp(idx);
%% MAXK Sorted Sorted Index for Each Column of Matrix 
% There is a matrix with N columns, and M rows, with numerical values. Generate 
% a table of sorted index, indicating in each column which row was the highest 
% in value, second highest, etc. (1) sort each column. (2) show the row number 
% from descending or ascending sort for each column as a matrix. 

% Create a 2D Array
rng(123);
N = 2;
M = 4;
mt_rand = rand(M,N);
disp(mt_rand);
%% 
% Use the maxk function to generate sorted index:

% maxk function
[val, idx] = maxk(mt_rand, M);
disp(val);
disp(idx);