%% Matlab Miscellaneous and Basic Numeric and Array Operations
% *back to* <https://fanwangecon.github.io *Fan*>*'s* <https://fanwangecon.github.io/Math4Econ/ 
% *Intro Math for Econ*>*,*  <https://fanwangecon.github.io/M4Econ/ *Matlab Examples*>*, 
% or* <https://fanwangecon.github.io/MEconTools/ *MEconTools*> *Repositories*
%% Divisor, Quotient and Remainder
% Given an array of integer values, and some divisor, find the quotient and 
% remainder.

it_divisor = 10;
for bl_int=[0,1]
    if (bl_int == 1)
        ar_integers = int16([1,2,3, 11,12,13, 21,22,23]);
    else
        ar_integers = [1,2,3, 11,12,13, 21,22,23];
    end
    for it_integer=ar_integers
        % Modulus and quotient
        if(isinteger(it_integer))
            it_quotient = idivide(it_integer, it_divisor);
        else
            it_quotient = fix(it_integer/it_divisor);
        end
        it_remainder = rem(it_integer, it_divisor);

        if (it_remainder == 1)
            fl_power = 1.0;
        elseif (it_remainder == 2)
            fl_power = 1.5;
        elseif (it_remainder == 3)
            fl_power = 2.0;
        end

        if (it_quotient == 0)
            fl_base = 2;
        elseif (it_quotient == 1)
            fl_base = exp(1);
        elseif (it_quotient == 2)
            fl_base = 10;
        end

        fl_value = fl_base^fl_power;

        % Print
        st_print = strjoin(...
            ["Divide test:", ...
            ['bl_int=' num2str(bl_int)], ...
            ['it_integer=' num2str(it_integer)], ...
            ['it_remainder=' num2str(it_remainder)], ...
            ['it_quotient=' num2str(it_quotient)], ...
            ['fl_value=' num2str(fl_value)], ...
            ], ";");
        disp(st_print);

    end
end
%% Check if Array is All Above or Below Zero
% There is an array that contains possible NaN values, check if all elements 
% of array are positive, or all elements are negative, ignoring the NaN values.

for it_arrays=[1,2,3,4,5,6]
    if (it_arrays == 1)
        ar_values = [0.0001, 0.0002, 0.0005, 0.0012, 0.0013, NaN, NaN, NaN, NaN];
    elseif (it_arrays == 2)
        ar_values = [NaN, -0.0002, -0.0005, -0.0012, -0.0013, NaN, NaN, NaN, NaN];
    elseif (it_arrays == 3)
        ar_values = [0.0001, 0.0002, 0.0005, 0.0012, 0.0013];
    elseif (it_arrays == 4)
        ar_values = [-0.0002, -0.0005, -0.0012, -0.0013];
    elseif (it_arrays == 5)
        ar_values = [-0.0002, 0.0005, -0.0012, -0.0013];
    elseif (it_arrays == 6)
        ar_values = [-0.0002, 0.0005, -0.0012, NaN, -0.0013];
    end
    bl_all_pos = min(ar_values(~isnan(ar_values))>=0);
    bl_all_neg = min(ar_values(~isnan(ar_values))<=0);
    st_print = ['str=' num2str(it_arrays) ...
        ' has bl_all_pos=' num2str(bl_all_pos) ' and bl_all_neg=' num2str(bl_all_neg)];
    disp(st_print);
end
%% Check Parameter Types
% There parameter input can either be a cell array or an integer, conditional 
% processing based on parameter input type. To distinguish between an array or 
% container map, for example, can use <https://www.mathworks.com/help/matlab/ref/isnumeric.html 
% isnumeric> or <https://www.mathworks.com/help/matlab/ref/isfloat.html isfloat>.

% Float and Cell
curEstiParamA = 1;
curEstiParamB = {146, 'R3'};
curEstiParamC = rand([1,5]);
curEstiParamD = [1,2,3,4.5];
curEstiParamE = containers.Map('KeyType','char', 'ValueType','any');
param_map('share_unbanked_j') = 12;
param_map('equi_r_j') = 2;
% test if is float
st_test = strjoin(...
    ["", ...
    ['isfloat(curEstiParamA)=' num2str(isfloat(curEstiParamA))], ...
    ['isfloat(curEstiParamB)=' num2str(isfloat(curEstiParamB))], ...
    ['isfloat(curEstiParamC)=' num2str(isfloat(curEstiParamC))], ...
    ['isfloat(curEstiParamD)=' num2str(isfloat(curEstiParamD))], ...
    ['isfloat(curEstiParamE)=' num2str(isfloat(curEstiParamE))], ...
    ], ";");
disp(st_test);
% test if is cell
st_test = strjoin(...
    ["", ...
    ['iscell(curEstiParamA)=' num2str(iscell(curEstiParamA))], ...
    ['iscell(curEstiParamB)=' num2str(iscell(curEstiParamB))], ...
    ['iscell(curEstiParamC)=' num2str(iscell(curEstiParamC))], ...
    ['iscell(curEstiParamD)=' num2str(iscell(curEstiParamD))], ...
    ['iscell(curEstiParamE)=' num2str(iscell(curEstiParamE))], ...
    ], ";");
disp(st_test);
% test if is numeric
st_test = strjoin(...
    ["", ...
    ['isnumeric(curEstiParamA)=' num2str(isfloat(curEstiParamA))], ...
    ['isnumeric(curEstiParamB)=' num2str(isfloat(curEstiParamB))], ...
    ['isnumeric(curEstiParamC)=' num2str(isfloat(curEstiParamC))], ...
    ['isnumeric(curEstiParamD)=' num2str(isfloat(curEstiParamD))], ...
    ['isnumeric(curEstiParamE)=' num2str(isfloat(curEstiParamE))], ...
    ], ";");
disp(st_test);
%% Check if a value is an array of single scalar boolean
% A function could take an array, if the array parameter input is boolean and 
% false, then generate the array needed by the function in a different way. All 
% that is needed is a NaN checker, works for scalar or array of NaN.

rng(123);
it_len = 3;
for it_case=[1,2,3]
    
    if (it_case == 1)        
        ob_val = rand(1,it_len);
    elseif (it_case == 2)
        % Single NaN
        ob_val = NaN;
    elseif (it_case == 3)
        % Single NaN
        ob_val = NaN(1,it_len);
    end
    
    if (~isnan(ob_val))
        % Input is the output vector since input is not NaN
        ob_val_out = ob_val;
    else
        % Generates random output vector since input is not provided
        ob_val_out = rand(1, it_len);
    end

    st_test = strjoin(...
        ["", ...
        ['ob_val=' num2str(ob_val)], ...
        ['ob_val_out=' num2str(ob_val_out)], ...
        ], ";");
    disp(st_test);    
end
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