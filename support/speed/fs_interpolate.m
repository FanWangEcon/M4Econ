interp_m1 = interp2(ar_z, ar_coh, mt_val_cur, mt_z_mesh, mt_coh_kpzgrids, 'linear');
f_grid_interpolant_value = griddedInterpolant(mt_z_mcoh', mt_coh_mz', mt_val_cur', 'linear');
interp_m2 = f_grid_interpolant_value(mt_z_mesh, mt_coh_kpzgrids);
