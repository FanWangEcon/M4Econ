% Print Container Map with numerical values
param_map_keys = keys(param_map);
param_map_vals = values(param_map);
for i = 1:length(param_map)
    st_display = strjoin(['pos =' num2str(i) '; key =' string(param_map_keys{i}) '; val =' string(param_map_vals{i})]);
    disp(st_display);
end

% Print map with functions, note func2str
param_map_keys = keys(func_map);
param_map_vals = values(func_map);
for i = 1:length(func_map)
    st_display = strjoin(['pos =' num2str(i) '; key =' string(param_map_keys{i}) '; val =' func2str(param_map_vals{i})]);
    disp(st_display);
end
