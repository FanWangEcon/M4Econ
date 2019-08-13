%% Default

[fl_crra, fl_c_min] = deal(1, 0.001);
[fl_r_fbr, fl_r_fsv, fl_w] = deal(0.035, 0.025, 1.28);
bl_display_setfunc = false;
bl_b_is_principle = false;
default_params = {fl_crra fl_c_min fl_r_fbr fl_r_fsv fl_w bl_display_setfunc};

%% Parse Parameters

% numvarargs is the number of varagin inputted
[default_params{1:length(varargin)}] = varargin{:};
[fl_crra, fl_c_min, fl_r_fbr, fl_r_fsv, fl_w, bl_display_setfunc] = default_params{:};
