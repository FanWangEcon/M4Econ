% Basic Error Example:
if (bl_save_mat_dist)
    % solve the full problem with vfi and endo. distribution
    % might not save vfi but only dist
    [mt_val, mt_pol, flag] = ds_az(param_map, support_map);
elseif (bl_save_mat_vfi)
    % solve VFI only
    [ar_dist_a, mt_dist_az, mt_pol, flag] = vf_az(param_map, support_map);
else
    error('both bl_save_mat_dist:%s, bl_save_mat_vfi:%s, nothing to do',...
          bl_save_mat_dist, bl_save_mat_vfi);
end
