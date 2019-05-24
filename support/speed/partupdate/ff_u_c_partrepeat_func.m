function ff_u_c_partrepeat_func(it_type, ar_it_rows_replace, ar_coh, ar_kp, ar_bp, f_u, f_c, it_iter, it_rown, it_coln, it_z)
% Different ways of retrieving/reusing c or u matrixes that are repeating

    if (it_type == 1)
        for it_iter_n=1:1:it_iter
            for it_z_m=1:1:it_z
                mt_u = f_u(f_c(ar_coh, ar_kp, ar_bp));
            end
        end
    end

    if (it_type == 2)
        ts_c_store = zeros([it_rown, it_coln, it_z]);
        for it_iter_n=1:1:it_iter
            for it_z_m=1:1:it_z
                if (it_iter_n == 1)
                    mt_c = f_c(ar_coh, ar_kp, ar_bp);
                    ts_c_store(:,:,it_z_m) = mt_c;
                    mt_u = f_u(mt_c);
                else
                    ts_c_store(ar_it_rows_replace,:,it_z_m) = f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace));
                    mt_u = f_u(ts_c_store(:,:,it_z_m));
                end
            end
        end
    end

    if (it_type == 3)
        ts_u_store = zeros([it_rown, it_coln, it_z]);
        for it_iter_n=1:1:it_iter
            for it_z_m=1:1:it_z
                if (it_iter_n == 1)
                    mt_c = f_c(ar_coh, ar_kp, ar_bp);
                    mt_u = f_u(mt_c);
                    ts_u_store(:,:,it_z_m) = mt_u;
                else
                    ts_u_store(ar_it_rows_replace,:,it_z_m) = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace)));
                    mt_u = ts_u_store(:,:,it_z_m);
                end
            end
        end
    end


    if (it_type == 4)
        for it_iter_n=1:1:it_iter
            for it_z_m=1:1:it_z
                if (it_iter_n == 1)
                    mt_c = f_c(ar_coh, ar_kp, ar_bp);
                    mt_u = f_u(mt_c);
                    if (rem(it_z_m,3) == 0)
                        mt_u_1 = mt_u;
                    end
                    if (rem(it_z_m,3) == 1)
                        mt_u_2 = mt_u;
                    end
                    if (rem(it_z_m,3) == 2)
                        mt_u_3 = mt_u;
                    end
                else
                    mt_updates = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace)));
                    if (rem(it_z_m,3) == 0)
                        mt_u_1(ar_it_rows_replace,:) = mt_updates;
                        mt_u = mt_u_1;
                    end
                    if (rem(it_z_m,3) == 1)
                        mt_u_2(ar_it_rows_replace,:) = mt_updates;
                        mt_u = mt_u_2;
                    end
                    if (rem(it_z_m,3) == 2)
                        mt_u_3(ar_it_rows_replace,:) = mt_updates;
                        mt_u = mt_u_3;
                    end
                end
            end
        end
    end


    if (it_type == 5)
        % This is the most efficient method
        cl_u_store = cell([it_z, 1]);
        tic;
        for it_iter_n=1:1:it_iter
            for it_z_m=1:1:it_z
                if (it_iter_n == 1)
                    mt_c = f_c(ar_coh, ar_kp, ar_bp);
                    mt_u = f_u(mt_c);
                    cl_u_store{it_z_m} = mt_u;
                else
                    cl_u_store{it_z_m}(ar_it_rows_replace,:) = f_u(f_c(ar_coh, ar_kp(ar_it_rows_replace), ar_bp(ar_it_rows_replace)));
                    mt_u = cl_u_store{it_z_m};
                end
            end
        end
    end

end
