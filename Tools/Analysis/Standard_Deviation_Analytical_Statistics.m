x = [5:5:20];

y = [ 0.4747179, 0.4747179, 0.47678905, 0.47678905];  % Outdoor

y1 = [ 0.49709581, 0.49709581, 0.49709581, 0.49709581];    % Indoor


plot(x, y, '-rd','LineWidth',2);
hold on;
plot(x, y1, '->b','LineWidth',2);


xlabel(' Distance (meter) ', 'fontweight', 'bold', 'FontSize', 11);
ylabel(' Standard Deviation ', 'fontweight', 'bold', 'FontSize', 11);

title('Standard Deviation ', 'fontweight', 'bold', 'FontSize', 11);
grid on;
legend('Outdoor Environment', 'Indoor Environment');
hold off;
set(gca, 'fontweight', 'bold', 'FontSize',11);