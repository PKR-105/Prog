x = [5:5:20];

y = [ 0.04589271115, 0.04589271115, 0.04587904709, 0.04587904709];  % Outdoor

y1 = [ 0.04697113924, 0.04697113924, 0.04697113924, 0.04697113924];    % Indoor


plot(x, y, '-rd','LineWidth',2);
hold on;
plot(x, y1, '->b','LineWidth',2);


xlabel(' Distance (meter) ', 'fontweight', 'bold', 'FontSize', 11);
ylabel(' Standard Error ', 'fontweight', 'bold', 'FontSize', 11);

title(' Standard Error ', 'fontweight', 'bold', 'FontSize', 11);
grid on;
legend('Outdoor Environment', 'Indoor Environment');
hold off;
set(gca, 'fontweight', 'bold', 'FontSize',11);