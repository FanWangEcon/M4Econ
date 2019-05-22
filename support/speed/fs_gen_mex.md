1. Go to Matlab Apps, get more apps
2. Search for: MinGW-w64, install:
3. check: mex -setup, should show message indicating Compiler
4. can run mex command:
    - mex splinterp1.cpp CXXOPTIMFLAGS='-O2 -DNDEBUG' CXXFLAGS='$CXXFLAGS -O2 -DNDEBUG'

Links:
https://www.mathworks.com/matlabcentral/fileexchange/52848-matlab-support-for-mingw-w64-c-c-compiler




data = rand([300, 45150], 'single')-0.5;
data_v = data(:);
tic;
util(data, 1.5, -100);
toc;
tic;
util(data_v, 1.5, -100);
toc;

function u = util(c, fl_crra, fl_u_neg_c)
    u = zeros(size(c)) + fl_u_neg_c;
    u(c > 0) = (((c(c > 0)).^(1-fl_crra)-1)./(1-fl_crra));
end
