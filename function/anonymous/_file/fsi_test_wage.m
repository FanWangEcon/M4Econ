function F=fsi_test_wage(j,educ)
% both
%it_edu_grid_type = 1;
% non-college only
%it_edu_grid_type = 2;
% college only
it_edu_grid_type = 3;
if (it_edu_grid_type == 1 || it_edu_grid_type == 2)
    % no changes needed when both, or low education type
    % low type = 1, educ = 1
    F = fsi_test_wage_equa(j,educ);
elseif (it_edu_grid_type == 3)
    % problem high type, educ should equal 2, but solving for high edu only, educ=1
    F = fsi_test_wage_equa(j,1);
end
end
