function fs_subscript_fan_replace(mt_c, mt_neg_log_idx, fl_replace_val)
    mt_c = mt_c.*(~mt_neg_log_idx) + fl_replace_val*(mt_neg_log_idx);
end
