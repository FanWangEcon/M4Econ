data = rand([300, 45150], 'single')-0.5;
data_v = data(:);
tic;
util(data, 1.5, -100);
toc;
tic;
util(data_v, 1.5, -100);
toc;

function u = util(c, fl_crra, fl_u_neg_c)
    u = zeros(size(c)) + fl_u_neg_c;
    u(c > 0) = (((c(c > 0)).^(1-fl_crra)-1)./(1-fl_crra));
end
