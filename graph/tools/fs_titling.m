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

%% Add Extra Legend One

legendCell = cellstr(num2str(ar_z', 'shock=%3.2f'));

xlinemax = xline(fl_w_max);
xlinemax.Color = 'b';
xlinemax.LineWidth = 1.5;

legendCell{length(legendCell) + 1} = 'max-agg-save';

legend(legendCell([ar_it_z_graph length(legendCell)]), 'Location', st_legend_loc);

%% Add Extra Legend with Selected Legend

figure('PaperPosition', [0 0 7 4]);
chart = plot(mt_coh_wkb);
clr = jet(numel(chart));
for m = 1:numel(chart)
    set(chart(m),'Color',clr(m,:))
end

% zero lines
xline(0);
yline(0);

% invalid points separating lines
yline_borrbound = yline(fl_b_bd);
yline_borrbound.HandleVisibility = 'on';
yline_borrbound.LineStyle = ':';
yline_borrbound.Color = 'blue';
yline_borrbound.LineWidth = 1;

title('Cash-on-Hand given w(k+b),k,z');
ylabel('Cash-on-Hand');
xlabel({'Index of Cash-on-Hand Discrete Point'...
    'Each Segment is a w=k+b; within segment increasing k'...
    'For each w and z, coh maximizing k is different'});

legend2plot = fliplr([1 round(numel(chart)/3) round((2*numel(chart))/4)  numel(chart)]);
legendCell = cellstr(num2str(ar_z', 'shock=%3.2f'));

legendCell{length(legendCell) + 1} = 'borrow-constraint';
chart(length(chart)+1) = yline_borrbound;
legend(chart([legend2plot length(legendCell)]), legendCell([legend2plot length(legendCell)]), 'Location', 'southeast');
