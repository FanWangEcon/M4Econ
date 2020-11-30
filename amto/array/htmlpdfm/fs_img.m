%% Matlab Array Basics and Miscellaneous
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Check Parameter Types
% There parameter input can either be a cell array or an integer, conditional 
% processing based on parameter input type

% Float and Cell
curEstiParamA = 1;
curEstiParamB = {146, 'R3'};
% test if is float
st_test = strjoin(...
    ["", ...
     ['isfloat(curEstiParamA)=' num2str(isfloat(curEstiParamA))], ...
     ['isfloat(curEstiParamB)=' num2str(isfloat(curEstiParamB))], ...
    ], ";");
disp(st_test);
% test if is cell
st_test = strjoin(...
    ["", ...
     ['iscell(curEstiParamA)=' num2str(iscell(curEstiParamA))], ...
     ['iscell(curEstiParamB)=' num2str(iscell(curEstiParamB))], ...
    ], ";");
disp(st_test);
%% Compare Array Values That are Approximately Similar
% <https://stackoverflow.com/a/33024979/8280804 What is the best way to compare 
% floats for almost-equality in Python?>
%% 
% * |rel_tol is a relative tolerance, it is multiplied by the greater of the 
% magnitudes of the two arguments; as the values get larger, so does the allowed 
% difference between them while still considering them equal.|
% * |abs_tol is an absolute tolerance that is applied as-is in all cases. If 
% the difference is less than either of those tolerances, the values are considered 
% equal.|

rel_tol=1e-09;
abs_tol=0.0;
if_is_close = @(a,b) (abs(a-b) <= max(rel_tol * max(abs(a), abs(b)), abs_tol));
disp(['1 and 1, if_is_close:' num2str(if_is_close(1,1))]);
disp(['1e-300 and 1e-301, if_is_close:' num2str(if_is_close(1e-300,1e-301))]);
disp(['1+1e-9 and 1+1e-10, if_is_close:' num2str(if_is_close(1+1e-9,1+1e-10))]);
%% Imaginary Number Examples

rng(123);

% Imaginary array
ar_img = rand([1,7]) + 1i*rand([1,7]);

% Regular Array
ar_real = rand([1,10]);

% Combine arrays
ar_full = [ar_real ar_img];
ar_full = ar_full(randperm(length(ar_full)));
disp(ar_full);

% real index
disp(~imag(ar_full));

% Get Real and not real Components
disp(ar_full(imag(ar_full) == 0));
disp(ar_full(imag(ar_full) ~= 0));