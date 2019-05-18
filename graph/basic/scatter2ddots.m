figure('PaperPosition', [0 0 10 6]);
for sub_j=1:1:2
    if(sub_j==1)
        mt_outcome = mt_pol_wkb;
        st_y_label = ['Aggregate Savings (kprime + bprime)'];
    end
    if(sub_j==2)
        mt_outcome = mt_pol_kap;
        st_y_label = ['Risky Capital Choice'];
    end

    subplot(1,2,sub_j)
    hold on;
    ar_it_z_graph = ([1 round((it_z_n-1)/3) round(2*((it_z_n-1)/3)) (it_z_n-1)]);
    clr = jet(length(ar_it_z_graph));
    i_ctr = 0;
    for i = ar_it_z_graph
        i_ctr = i_ctr + 1;
        ar_coh_curz = mt_coh_kpzgrids(:, i);
        ar_w_opti_curz = mt_outcome(:, i);
        chart = scatter(ar_coh_curz, ar_w_opti_curz, 1, ...
                        'MarkerEdgeColor', clr(i_ctr,:), ...
                        'MarkerFaceColor', clr(i_ctr,:));
    end
    grid on;
    legendCell = cellstr(num2str(ar_z', 'shock=%3.2f'));
    title('Cash-on-Hand')
    ylabel(st_y_label)
    xlabel({'Cash on Hand Levels'})
    legend(legendCell(ar_it_z_graph), 'Location','northwest');

    xline0 = xline(0);
    xline0.HandleVisibility = 'off';
    yline0 = yline(0);
    yline0.HandleVisibility = 'off';
    grid on;
    hline = refline([1 0]);
    hline.Color = 'k';
    hline.LineStyle = ':';
    hline.HandleVisibility = 'off';
end
