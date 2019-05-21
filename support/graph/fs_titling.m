%% Basic
legendCell = cellstr(num2str(ar_z', 'shock=%3.2f'));
title('Cash-on-Hand given w(k+b),k,z')
ylabel('Cash-on-Hand')
xlabel({'Index of Cash-on-Hand Discrete Point'...
        'Each Segment is a w=k+b; within segment increasing k'...
        'For each w and z, coh maximizing k is different'})
legend(legendCell, 'Location','northwest');
grid on;

%% Specify Legends Manually

fl_fu_c_fixed = fu_c_fixed();
ar_interp_gridded_near = fu_interp_gridded_near();
ar_interp_gridded_linr = fu_interp_gridded_linr();
ar_interp_gridded_spln = fu_interp_gridded_spln();

figure('PaperPosition', [0 0 10 10]);
hold on;
g1 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_near(:), 30, 'filled');
g2 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_linr(:), 30, 'filled');
g3 = scatter(fl_fu_c_fixed(:),  ar_interp_gridded_spln(:), 30, 'filled');
legend([g1, g2, g3], {'near','linear','spline'}, 'Location','northwest',...
        'NumColumns',1,'FontSize',12,'TextColor','black');
hline = refline([1 0]);
hline.Color = 'k';
hline.LineStyle = ':';
hline.HandleVisibility = 'off';
grid on;
grid minor;

title(sprintf('griddedInterpolant comparison, crra utility approximation, interp grid n=%d', it_interp_points))
ylabel('Actual Utility Evaluated at c')
xlabel('Approximated Util based on  Interpolation')
