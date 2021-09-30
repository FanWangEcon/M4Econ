%% 2021-07-01 21:39
% Given an existing table, we might want to replace values in specific tables cells. There are two main methods to accomplish as shown below. If the string name is known, the TAB.COL(ROW) replacement method is dramatically faster. Test speed with timeit first loading the value in table cell via method a vs b, method a takes 20 to 30 times more time than method b. Then test assigment with tic toc, with about a 7 time speed difference.

% Create a Table and fill it with three rows of data
mt_st_variable_names_types = [["category", "string"]; ...
    ["wage", "double"]; ...
    ["skilled", "logical"]; ...
    ["labdemand", "double"]; ...
    ["labsupply", "double"]; ...
    ["labsupplyprob", "string"]; ...
    ["rho_manual", "double"]; ...
    ["rho_routine", "double"]; ...
    ["rho_analytical", "double"]; ...
    ];
tb_equilibrium = table('Size',[0,size(mt_st_variable_names_types,1)],...
	'VariableNames', mt_st_variable_names_types(:,1),...
	'VariableTypes', mt_st_variable_names_types(:,2));
for it_rho_set=[1,2,3]
    if (it_rho_set == 1)
        cl_data_row = {'C001',1,  true,1,1,0.5,0.5,0.5,0.5};
    elseif (it_rho_set == 2)
        cl_data_row = {'C002',1,  0   ,1.2,0.6,0.5,0.45,0.5,0.5};
    elseif (it_rho_set == 3)
        cl_data_row = {'C011',1.1,false,1.2,0.6,0.5,0.45,0.45,0.45};
    end
    tb_equilibrium = [tb_equilibrium; cl_data_row];
end
disp(tb_equilibrium);

% Two replacement functions
f_replace_method_a = @() tb_equilibrium{1, "labdemand"};
f_replace_method_b = @() tb_equilibrium.labdemand(1);

% Time replacing one value
fl_speed_method_a = timeit(f_replace_method_a);
fl_speed_method_b = timeit(f_replace_method_b);
fl_speed_a_b_ratio = fl_speed_method_a/fl_speed_method_b;
disp(['Load table cell time, fl_speed_a_b_ratio=' num2str(fl_speed_a_b_ratio)]);

% Timing assignment with Method A
ar_rand = rand([1,1e4]);
fl_time_start = tic;
for (fl_rand=ar_rand)
    tb_equilibrium{1, "labdemand"} = fl_rand;
end
fl_time_end = toc(fl_time_start);
disp(['Method A assigment fl_time_end = ' num2str(fl_time_end)]);

% Timing assignment with Method A
fl_time_start = tic;
for (fl_rand=ar_rand)
    tb_equilibrium.labdemand(1) = fl_rand;
end
fl_time_end = toc(fl_time_start);
disp(['Method B assignment fl_time_end = ' num2str(fl_time_end)]);

%% 2021-07-01 21:59
% Simple timing example. In the following example, we want to simulate many random normal draws with different means. It is faster to call Method B which uses mean and standard deviation as parameters for normrnd, rather than using the z-score inverse function to transform from standard normal to normal as in method A. However, this is only the case when we want to draw once. Using tic and toc, it is much faster to use method A when we want to draw from many normal distributions with different means.

% Two method to generate random normal draws
f_replace_method_a = @() normrnd(0, 1)*10+10;
f_replace_method_b = @() normrnd(10, 10);

% Time replacing one value
fl_speed_method_a = timeit(f_replace_method_a);
fl_speed_method_b = timeit(f_replace_method_b);
fl_speed_a_b_ratio = fl_speed_method_a/fl_speed_method_b;
disp(['Load table cell time, fl_speed_a_b_ratio=' num2str(fl_speed_a_b_ratio)]);

% Timing assignment with Method A
ar_rand = rand([1,1e4]);
ar_z = NaN([1,1e4]);
fl_time_start = tic;
ar_z = normrnd(0, 1)*10+ar_rand;
fl_time_end = toc(fl_time_start);
disp(['Method A fl_time_end = ' num2str(fl_time_end)]);

% Timing assignment with Method A
fl_time_start = tic;
for (it_rand_ctr=1:length(ar_rand))
    ar_z(it_rand_ctr) = normrnd(ar_rand(it_rand_ctr), 10);
end
fl_time_end = toc(fl_time_start);
disp(['Method B fl_time_end = ' num2str(fl_time_end)]);

%% 2021-07-02 11:37
% The key for the container map below are char of an array, with string and array values associated with each key. Access values by converting array to string in the form of the keys.

% Define a Map with stringed array as keys
param_map = containers.Map('KeyType','char', 'ValueType','any');
ar_key1 = [11, 12, 21, 22, 31, 32];
ar_key2 = [10, 20, 30];
ar_key3 = [2];
ar_key4 = [1];
param_map(num2str(ar_key1)) = "nest1";
param_map(num2str(ar_key2)) = [1,3,4];
param_map(num2str(ar_key3)) = "nest3";
param_map(num2str(ar_key4)) = [2,3;4,5];

% Show keys and values
disp(param_map.keys);
disp(param_map.values);

% Access value via stringed arrays
disp(param_map(num2str(ar_key2)))

%% 2021-07-17 23:14
% There is a loop, divide N elements into O segments of M elements or less in each segment.

it_count_m = 100;
for it_ctr=1:5
    rng(it_ctr);
    it_elements_n = round(rand()*1000);
    ar_seg_ends = unique([1:it_count_m:it_elements_n it_elements_n]);
    disp(ar_seg_ends);
end
