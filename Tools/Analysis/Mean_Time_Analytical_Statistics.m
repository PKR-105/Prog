x = [5:5:20];

y = [ 2.6635514, 2.6635514, 2.6574074, 2.6574074];  % Outdoor

y1 = [ 2.5714286, 2.5714286, 2.5714286, 2.5714286];    % Indoor


plot(x, y, '-rd','LineWidth',2);
hold on;
plot(x, y1, '->b','LineWidth',2);


xlabel(' Distance (meter) ', 'fontweight', 'bold', 'FontSize', 11);
ylabel(' Mean Transmission Time (sec) ', 'fontweight', 'bold', 'FontSize', 11);

title(' Mean Transmission Time ', 'fontweight', 'bold', 'FontSize', 11);
grid on;
legend('Outdoor Environment', 'Indoor Environment');
hold off;
set(gca, 'fontweight', 'bold', 'FontSize',11);