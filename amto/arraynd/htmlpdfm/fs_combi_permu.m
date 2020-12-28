%% Joint Arrays All Combinations and by Random Subset
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Given Several Arrays, General all Possible Combinations
% There are several parameters, might want to simulate at all possible combinations. 
% In the example below, there are four parmeters, generate a table with all possible 
% combinations of the four parameters.

%% A. Quadc linh refh and refsd parameter grids
[it_p1, it_p2, it_p3] = deal(4, 3, 3);
ar_p1 = linspace(-0.09, -0.02, it_p1);
ar_p2 =  linspace( 0.020, 0.100, it_p2);
ar_p3 =  linspace(-0.100, -0.020, it_p3);
ar_p4 =  [0.05];

%% B. Mesh Parameters together
% ndgrid mesh together
[mn_p1, ~] = ndgrid(ar_p1, ar_p2, ar_p3, ar_p4);
% combine
[ar_p1_idx, ar_p2_idx, ar_p3_idx, ar_p4_idx] = ind2sub(size(mn_p1), find(mn_p1));
% Index and values
ar_p1_flat = ar_p1(ar_p1_idx)';
ar_p2_flat = ar_p2(ar_p2_idx)';
ar_p3_flat = ar_p3(ar_p3_idx)';
ar_p4_flat = ar_p4(ar_p4_idx)';
mt_paramsmesh_long = [ar_p1_idx(:), ar_p1_flat(:), ...
    ar_p2_idx(:), ar_p2_flat(:), ...
    ar_p3_idx(:), ar_p3_flat(:), ...
    ar_p4_idx(:), ar_p4_flat(:)];
% Sort by a and z
mt_paramsmesh_long = sortrows(mt_paramsmesh_long, [1,3, 5]);

% C. Create Table
tb_paramsmesh_long = array2table(mt_paramsmesh_long);
cl_col_names_a = {'quadc_idx', 'quadc_val', ...
    'linh_idx', 'linh_val', ...
    'refh_idx', 'rehfh_val', ...
    'refsd_idx', 'rehfsd_val'};
tb_paramsmesh_long.Properties.VariableNames = cl_col_names_a;
% D. Display Table
disp(tb_paramsmesh_long);
%% Matlab Draw Random with and without Replacement

%Generate a matrix named foo, with limited numbers
rng(1234);
foo = unique((round((randn(5,1)+1)*100)));
disp(foo);

% draw 10 random samples without replacement
index = randsample(1:length(foo), 4);
bar_rand_noreplace = foo(index,:);

% draw 1000 random samples with replacement
index = randsample(1:length(foo), 4, true);
bar_rand_replace = foo(index,:);

% Display
disp(table(bar_rand_noreplace, bar_rand_replace));
%% Matrix Meshgrid to Loop Permutated Vectors
% Meshgrid to generate all permutations of arrays.

k = linspace(1,10,10);
kp = linspace(1,10,10);
z = linspace(0,1,10);
 
[kM kpM zM] = meshgrid(k,kp,z);
kMVec = kM(:);
kMpVec = kpM(:);
zMVec = zM(:);
 
outputVec = zeros(size(zMVec));
for a=1:length(zMVec)
     outputVec(a) = kMVec(a)+kMpVec(a)+zMVec(a);
end
 
outputTens = reshape(outputVec,size(kM));
disp(outputTens);
%% Given Integer Arrays, All Possible Combinations
% given any sizes arrays, N of them, create all possible combinations

ar_it_a = 1:3;
ar_it_b = 1:2;
ar_it_c = 2:4;
ar_it_d = -1:-1:-2;
ar_it_e = 0.1;

cl_ar_all = {ar_it_a, ar_it_b, ar_it_c, ar_it_d, ar_it_e};
cl_mt_all = cl_ar_all;
[cl_mt_all{:}] = ndgrid(cl_ar_all{:});
mt_it_allcombo = cell2mat(cellfun(@(m) m(:), cl_mt_all, 'uni', 0));

disp(mt_it_allcombo)