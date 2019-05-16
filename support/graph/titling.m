legendCell = cellstr(num2str(ar_z', 'shock=%3.2f'));
title('Cash-on-Hand given w(k+b),k,z')
ylabel('Cash-on-Hand')
xlabel({'Index of Cash-on-Hand Discrete Point'...
        'Each Segment is a w=k+b; within segment increasing k'...
        'For each w and z, coh maximizing k is different'})
legend(legendCell, 'Location','northwest');
grid on;
