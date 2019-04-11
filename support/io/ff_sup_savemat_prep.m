function [st_fil_path_name_full] = ff_sup_savemat_prep(st_path_folder, st_file_name)

    mkdir(st_path_folder)
    st_fil_path_name_full = [st_path_folder st_file_name]

end
