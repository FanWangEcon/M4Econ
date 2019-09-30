%% Container Map: Basics of Container Map
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% If key is in container

param_map_a = containers.Map('KeyType','char', 'ValueType','any');
param_map_a('fl_b_bd') = -3;
param_map_a('fl_w_max') = 50;
param_map_a('fl_kp_min') = 0;
param_map_a('it_w_i') = 100;

disp(isKey(param_map_a, 'it_w_i'));
disp(isKey(param_map_a, 'it_w_i1'));
%% Container Key Loop
% Generate new container key within loop dynamically

param_map_a = containers.Map('KeyType', 'char', 'ValueType','any');

rng(123);
for st_cur = ["abc", "efg", "qqq"]

    if (strcmp(st_cur, "abc"))
       data = rand([1,1]);
    elseif (strcmp(st_cur, "efg"))
       data = 123.123;
    elseif (strcmp(st_cur, "qqq"))
       data = -123;
    end

    % common function
    fl_sh_0p1pc_j = data*2 + 1;
    fl_sh_5pc_j = data/2 - 1;

    % generate map keys
    st_key_sh_0p1pc_j = strjoin([st_cur, 'sh_0p1pc_j'], "_");
    st_key_sh_5pc_j = strjoin([st_cur, 'sh_5pc_j'], "_");

    % store
    param_map_a(st_key_sh_0p1pc_j) = fl_sh_0p1pc_j;
    param_map_a(st_key_sh_5pc_j) = fl_sh_5pc_j;

end

disp(param_map_a.keys);
disp(param_map_a.values);