%% Set Marker
% https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.scatter-properties.html

close all;
figure();
size = 100;
s = scatter(1:10,1:10,size);

s.Marker = 's';
% color picked by using: uisetcolor
s.MarkerEdgeColor = [0    0.4471    0.7412];
s.MarkerEdgeAlpha = 0.5;
s.MarkerFaceColor = [.61 .51 .74];
s.MarkerFaceAlpha = 1.0;
s.LineWidth = 10;

% 'o'	Circle
% '+'	Plus sign
% '*'	Asterisk
% '.'	Point
% 'x'	Cross
% 'square' or 's'	Square
% 'diamond' or 'd'	Diamond
% '^'	Upward-pointing triangle
% 'v'	Downward-pointing triangle
% '>'	Right-pointing triangle
% '<'	Left-pointing triangle
% 'pentagram' or 'p'	Five-pointed star (pentagram)
% 'hexagram' or 'h'	Six-pointed star (hexagram)
% 'none'	No markers


%% Scatter with Edge and Face Color and Transparency

fig_cur_z = scatter(ar_xvar, mt_outcome(:,m), 1, ...
    'Marker', 'O', ...
    'MarkerEdgeColor', clr(m,:), 'MarkerFaceAlpha', 0.1, ...
    'MarkerFaceColor', clr(m,:), 'MarkerEdgeAlpha', 0.1);
chart(m) = fig_cur_z;


%% Complete Scatter Example, Color for Z, Transparent
% plot a matrix lin and log, matrix represents some outcomes.
% each column different color, each row different state

if (bl_graph_coh_t_coh)

    % 1. Single Array A' Next Period and COH today
    ar_pol_a_full = mt_pol_a(:);
    ar_coh_full = mt_coh(:);

    % 2. COH Next Period
    mt_coh_next = f_coh(ar_z, ar_pol_a_full);

    % 3. Start Figure
    if(~bl_graph_onebyones)
        figure('PaperPosition', [0 0 14 4]);
        ar_sub_j = 1:1:4;
    else
        ar_sub_j = [1 2];
    end

    for sub_j = ar_sub_j

        % 4. Legends and values
        if (ismember(sub_j, [1]))
            bl_log_coh = 0;
        else
            bl_log_coh = 1;
        end

        if (sub_j==1)

            mt_outcome = mt_coh_next;
            ar_xvar = ar_coh_full;

            st_y_label = 'cash-on-hand t+1 = coh(a''(a,z), z'')';
            st_x_label = 'cash-on-hand t = coh(a,z)';
            st_title = 'COH(z'',a''(COH, z)) Reachable COH'' given COH';
            st_legend_loc = 'southeast';

        end
        if (sub_j==2)

            mt_outcome = log(mt_coh_next - min(ar_a) + 1);
            ar_xvar = log(ar_coh_full - min(ar_a) + 1);

            st_y_label = 'log(COH'' - min(a'') + 1)';
            st_title = 'LOGLOG COH(z'',a''(COH, z)) Reachable COH'' given COH';
            st_legend_loc = 'southeast';

        end

        % 5. Start Figure
        if (~bl_graph_onebyones)
            subplot(1,2,sub_j)
        else
            figure('PaperPosition', [0 0 7 4]);
        end
        hold on;

        % 7. Color
        clr = jet(length(ar_z));
        for m = 1:length(ar_z)
            % scatter
            fig_cur_z = scatter(ar_xvar, mt_outcome(:,m), 1, ...
                'MarkerEdgeColor', clr(m,:), 'MarkerFaceAlpha', 0.1, ...
                'MarkerFaceColor', clr(m,:), 'MarkerEdgeAlpha', 0.1);
            chart(m) = fig_cur_z;
        end

        % 8. Legends
        legend2plot = fliplr([1 round(length(ar_z)/4) round((2*length(ar_z))/4) round((3*length(ar_z))/4)  length(ar_z)]);
        legendCell = cellstr(num2str(ar_z', 'shock next=%3.2f'));
        legend(chart(legend2plot), legendCell(legend2plot), 'Location', st_legend_loc);

        % 9. Titling etc
        grid on;
        title([st_title_prefix st_title]);
        ylabel(st_y_label);
        xlabel(st_y_label)

        if (bl_log_coh == 0)
            xline0 = xline(0);
            xline0.HandleVisibility = 'off';

            yline0 = yline(0);
            yline0.HandleVisibility = 'off';
        else
            xline0 = xline(log(0 - min(ar_a) + 1));
            xline0.HandleVisibility = 'off';

            yline0 = yline(log(0 - min(ar_a) + 1));
            yline0.HandleVisibility = 'off';
        end


        % 45 Degree Line
        hline = refline([1 0]);
        hline.Color = 'k';
        hline.LineStyle = ':';
        hline.HandleVisibility = 'off';
        hline.LineWidth = 5;

        grid on;
        grid minor;
    end

    % save file
    if (bl_img_save)
        mkdir(support_map('st_img_path'));
        st_file_name = [st_img_prefix st_img_name_main '_coh' st_img_suffix];
        saveas(gcf, strcat(st_img_path, st_file_name));
    end

end
