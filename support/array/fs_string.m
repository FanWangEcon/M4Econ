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
