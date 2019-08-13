% is number in list
ar_fl_list = [1,2,3,4,5];
fl_index = 1.1;
fprintf('fl_index %.2f is not in [%s]\n', fl_index, num2str(ar_fl_list));
if (ismember(fl_index, ar_fl_list))
    fprintf('fl_index %.2f is in [%s]\n', fl_index, num2str(ar_fl_list));
else
    fprintf('fl_index %.2f is not in [%s]\n', fl_index, num2str(ar_fl_list));
end

% cumulative sum
a = [1 2 3]
cumsum(a)

ar_rand = rand([20,1]);
cumsum(sort(ar_rand))/sum(ar_rand)
ar_seq = rand([20,1]);
cumsum(sort(ar_rand))/sum(ar_rand)
