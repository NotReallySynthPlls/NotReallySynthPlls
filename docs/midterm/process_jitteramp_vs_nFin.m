clear; close all; clc;

D = readmatrix('asap7_jitteramp_vs_nFin.csv');

nfin = D(:,1);
ff_jitteramp = D(:,2);
ss_jitteramp = D(:,3);
tt_jitteramp = D(:,4);

fig_jitteramp = figure('Position', [100 100 900 600]); clf;
h(1) = plot(nfin, tt_jitteramp, 'b', 'LineWidth', 2); hold on;
plot(nfin, tt_jitteramp, 'b.', 'MarkerSize', 20); hold on;
h(2) = plot(nfin, ss_jitteramp, 'r', 'LineWidth', 2); hold on;
plot(nfin, ss_jitteramp, 'r.', 'MarkerSize', 20); hold on;
h(3) = plot(nfin, ff_jitteramp, 'g', 'LineWidth', 2); hold on;
plot(nfin, ff_jitteramp, 'g.', 'MarkerSize', 20); hold on;
grid on;
title('DLL stage jitter amplification (maximum delay)');
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 16);
xlabel('MOSCAP sizing ratio');
ylabel('Jitter Amplification (s/s)');
legend(h,'TT', 'SS (-10% V_{DD})', 'FF (+10% V_{DD})', 'Location', 'NorthWest');
hold off;

saveas(fig_jitteramp, 'fig_jitteramp.png');