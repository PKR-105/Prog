y = [99.5015 98.3077 99.2746 94.9282; 100 99.979 100 99.8986; 100 99.8064 99.7573 99.4521; 99.9853 90.3226 99.7264 89.6595; 99.8811 99.7863 98.9765 99.6478; 99.1015 99.8723 99.7925 94.8905]; 
  % ['Technique 1'  'Technique 2'  'Technique 3'  'Technique 4']

n = 0:100:500;
bar(n, y);

xlabel('Pause Time (Sec)', 'fontweight', 'bold', 'FontSize', 11);  % To increase font and bold charecter of Xlabel
ylabel('Packet Delivery Ratio %', 'fontweight', 'bold', 'FontSize', 11);  % To increase font and bold charecter of Xlabel

grid on;
legend('ASIPEMS - 50 nodes', 'ASIPEMS - 100 nodes', 'IEEE 802.11 MAC - 50 nodes', 'IEEE 802.11 MAC - 100 nodes');

set(gca, 'fontweight', 'bold', 'FontSize',11);   % To increase font and bold charecter of Value
