x = [5:5:20];

y = [ 0.22535708, 0.22535708, 0.2273278, 0.2273278];  % Outdoor

y1 = [ 0.24710425, 0.24710425, 0.24710425, 0.24710425];    % Indoor


plot(x, y, '-rd','LineWidth',2);
hold on;
plot(x, y1, '->b','LineWidth',2);


xlabel(' Distance (meter) ', 'fontweight', 'bold', 'FontSize', 11);
ylabel(' Variance ', 'fontweight', 'bold', 'FontSize', 11);
title(' Variance ', 'fontweight', 'bold', 'FontSize', 11);
grid on;
legend('Outdoor Environment', 'Indoor Environment');
hold off;
set(gca, 'fontweight', 'bold', 'FontSize',11);