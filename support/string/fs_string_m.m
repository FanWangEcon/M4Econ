%% String: Single String Element Manipulation
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/ 
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/ 
% *Dynamic Asset*>* Repository.*
%% Change File Name MLX to M

st_file_name_mlx = 'continuous_differentiable.mlx';
at_st_split_file_name = split(st_file_name_mlx, ".");
st_file_name_m = strcat(at_st_split_file_name{1}, '_m.m');
disp(st_file_name_m);