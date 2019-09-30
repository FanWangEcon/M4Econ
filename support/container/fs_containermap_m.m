%% Container Map: Display Container Map Keys and Values
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% Print Keys and Values
% Define container

% Define Container
param_map = containers.Map('KeyType','char', 'ValueType','any');
param_map('share_unbanked_j') = 12;
param_map('equi_r_j') = 2;
param_map('equi_w_j') = 'abc';
param_map('equi_P_j') = 1.2;

%% 
% Print

param_map_keys = keys(param_map);
param_map_vals = values(param_map);
for i = 1:length(param_map)
    st_display = strjoin(['pos =' num2str(i) '; key =' string(param_map_keys{i}) '; val =' string(param_map_vals{i})]);
    disp(st_display);
end