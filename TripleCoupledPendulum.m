clear; clc;
syms xa(t) xb(t) xc(t);

% Constants
g = 9.8; k = 1; m = 1; l = 1;
a = g/l; b = k/m;

% System of Differential Equations
ode1 = diff(xa, t, 2) + a*xa + b*(xa-xb) == 0;
ode2 = diff(xb, t, 2) + a*xb - b*(xa-xb) + b*(xb-xc) == 0;
ode3 = diff(xc, t, 2) + a*xc - b*(xb-xc) == 0;
odes = [ode1, ode2, ode3];

dxa = diff(xa);
dxb = diff(xb);
dxc = diff(xc);

% Initial Conditions
cond1 = xa(0) == 0; cond2 = xb(0) == 0; cond3 = xc(0) == 0;
cond4 = dxa(0) == 0; cond5 = dxb(0) == 0; cond6 = dxc(0) == 0;
cond1 = xa(0) == -0.2;
conds = [cond1, cond2, cond3, cond4, cond5, cond6];

% Solve ODE
[xasol(t), xbsol(t), xcsol(t)] = dsolve(odes, conds);
disp(xasol(t)); disp(xbsol(t)); disp(xcsol(t));

% Plot Graph of Amplitude by Time
fplot(xasol(t), [0, 10]); hold on; grid on; fplot(xbsol(t), [0, 10]); fplot(xcsol(t), [0, 10]); 
legend('A', 'B', 'C', 'Location', 'best'); 
title('Movement of Three-Way Coupled Pendulum')
xlabel('Time');
ylabel('Amplitude');

% Animation of Movement over Time
% h = figure;
% filename = 'testAnimated.gif';
% dt = linspace(0, 20, 100);
% for t = dt
%     ya = -0.5+xasol(t); yb = xbsol(t); yc = 0.5+xcsol(t);
%     plot([-1, 1], [1, 1], 'Color', 'k', 'LineWidth', 1);
%     hold on;
%     plot([ya -0.5], [0 1], 'Color', 'k', 'LineWidth', 1, 'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor','black','MarkerFaceColor',[0 0 0],'MarkerIndices', 1); 
%     plot([yb 0], [0 1], 'Color', 'k', 'LineWidth', 1, 'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor','black','MarkerFaceColor',[0 0 0], 'MarkerIndices', 1); 
%     plot([yc 0.5], [0 1], 'Color', 'k', 'LineWidth', 1, 'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor','black','MarkerFaceColor',[0 0 0], 'MarkerIndices', 1);
%     xlim([-1 1]); ylim([-0.2 1.2]); title('Movement of Three-Way Coupled Pendulum'); set(gca,'visible','off', 'xtick', []);
%     hold off;
%     drawnow();
%     
%     frame = getframe(h); 
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256); 
%     
%     if t == 0 
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0); 
%     else 
%         imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0); 
%     end 
% end