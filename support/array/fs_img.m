%% Matlab Check Imaginary Numbers
% *back to <https://fanwangecon.github.io Fan>'s
% <https://fanwangecon.github.io/M4Econ/ Reusable Matlab>
% Repository or <https://fanwangecon.github.io/CodeDynaAsset/ Dynamic Asset> Repository.*

%% Basic Examples

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
