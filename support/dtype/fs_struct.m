%% table summary is stored as struct, How to print out all variable names from table struct?

tab_aprime_bridge = table(ar_coh_today, ar_aprime, ar_b_bridge, ar_c_bridge, ar_aprime_nobridge);
tab_aprime_bridge.Properties.VariableDescriptions{'ar_coh_today'} = ...
    'ar_coh_today = cash on hand someone arrives in the period with given debt and current income';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_aprime'} = ...
    'ar_aprime = func called during finding optimal aprime, this is the current aprime overall choice';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_b_bridge'} = ...
    'ar_b_bridge ´asdflkj asdlfj ';

disp(tab_aprime_bridge);

% Summary is a struct
sc_summary = summary(tab_aprime_bridge);

% Get Variable Names (struct fields are variable names)
cl_var_name = fieldnames(sc_summary);
for it_var_name = 1:length(cl_var_name)
    % Get VariableDescrptions defined above
    sc_summary.(cl_var_name{it_var_name}).Description
end
