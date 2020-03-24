clear; close all; clc;

D = readmatrix('supply_droop.csv');

time = D(:,1)./1E-6;
vin = D(:,3);
current = D(:,4);
vout = D(:,2);

time_zoom_start = 0.9;
time_zoom_end = 1.2;
idx_zoom = (time > time_zoom_start) & (time < time_zoom_end);
time_zoom = time(idx_zoom);
vout_zoom = vout(idx_zoom);


fig_droop = figure('Position', [100 100 900 600]); clf;
ax(1) = subplot(211);
plot(time, current, 'b', 'LineWidth', 2); hold on;
xlim([0 10]);
ylim([0.05 0.1]);
grid on;
title('Load current vs. time');
% xlabel('Time (us)');
ylabel('Current (A)');
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 16);

ax(2) = subplot(212);
title_str = sprintf('V_{DD} vs. time');
plot(time, vout, 'b', 'LineWidth', 2); hold on;
title(title_str);
xlim([0 10]);
ylim([0.88 1.02]);
xlabel('Time (us)');
ylabel('Voltage (V)');
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 16);
hold off;
grid on;

axes('Position', [0.3 0.26 0.4 0.15]);
box on;
plot(time_zoom, vout_zoom, 'b', 'LineWidth', 2); hold on;
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 12);
axis tight;
grid on;
hold off;
linkaxes(ax,'x');


saveas(fig_droop, 'fig_droop.png');

