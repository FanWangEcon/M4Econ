% Convert Numeric Array to String, Apeend Prefix to all elements.
ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_st_wth_prefix = strcat('row=', string(ar_abc1));
disp(ar_st_wth_prefix);

% Does Array Exist in Longer Array as Subset
ar_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_abc2 = [0.4 0.1 0.2 0.3 0.4];
ar_efg = [0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4 0.1 0.2 0.3 0.4];
st_abc1 = strjoin(string(num2str(ar_abc1)));
st_abc2 = strjoin(string(num2str(ar_abc2)));
st_efg = strjoin(string(num2str(ar_efg)));
contains(st_efg, st_abc1)
contains(st_efg, st_abc2)


util(rand([300, 45150], 'single'), 1.5);

% Display Convert to String
fprintf('Display string [%s]', num2str([1,2,3]));
fprintf('Display string [%s]', num2str(1.1));
fprintf('Display string [%s]', 'abc');
