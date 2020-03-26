clear; close all; clc;

D = readmatrix('asap7_dlystage_vs_nFin.csv');

nfin = D(:,1);
ff_dlyratio = D(:,2)./D(:,3);
ss_dlyratio = D(:,4)./D(:,5);
tt_dlyratio = D(:,6)./D(:,7);

fig_dlystage = figure('Position', [100 100 600 600]); clf;
ax(1) = subplot(211);
clear h;
h(1) = plot(nfin, tt_dlyratio, 'b', 'LineWidth', 2); hold on;
% plot(nfin, tt_dlyratio, 'b.', 'MarkerSize', 20); hold on;
h(2) = plot(nfin, ss_dlyratio, 'r', 'LineWidth', 2); hold on;
% plot(nfin, ss_dlyratio, 'r.', 'MarkerSize', 20); hold on;
h(3) = plot(nfin, ff_dlyratio, 'g', 'LineWidth', 2); hold on;
% plot(nfin, ff_dlyratio, 'g.', 'MarkerSize', 20); hold on;
grid on;
title('ASAP7 Schematic DLL stage min/max delay ratio');
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 10);
xlabel('MOSCAP sizing');
ylabel('Min/max delay ratio');
legend(h,'TT', 'SS (-10% V_{DD})', 'FF (+10% V_{DD})', 'Location', 'NorthWest');
hold off;

clear D;
D = readmatrix('asap7_jitteramp_vs_nFin.csv');

nfin = D(:,1);
ff_jitteramp = D(:,2);
ss_jitteramp = D(:,3);
tt_jitteramp = D(:,4);

ax(2) = subplot(212);
clear h;
h(1) = plot(nfin, tt_jitteramp, 'b', 'LineWidth', 2); hold on;
% plot(nfin, tt_jitteramp, 'b.', 'MarkerSize', 20); hold on;
h(2) = plot(nfin, ss_jitteramp, 'r', 'LineWidth', 2); hold on;
% plot(nfin, ss_jitteramp, 'r.', 'MarkerSize', 20); hold on;
h(3) = plot(nfin, ff_jitteramp, 'g', 'LineWidth', 2); hold on;
% plot(nfin, ff_jitteramp, 'g.', 'MarkerSize', 20); hold on;
grid on;
title('ASAP7 Schematic DLL stage jitter amplification (@ max delay)');
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 10);
xlabel('MOSCAP sizing');
ylabel('Jitter Amplification');
legend(h,'TT', 'SS (-10% V_{DD})', 'FF (+10% V_{DD})', 'Location', 'NorthWest');
hold off;

linkaxes(ax,'x');



saveas(fig_dlystage, 'fig_dllasap7.png');

