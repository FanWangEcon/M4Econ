%% Array Draw Random Index and Find Combinations or Permuations
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/CodeDynaAsset/ *Dynamic Asset*> *Repositories*
%% *Matlab Draw Random with and without Replacement*

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
%% Given integer arrays, all possible combinations
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