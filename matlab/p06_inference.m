clear
close all


d = load('data.txt');

data.t = d(:,1);
data.y = [ d(:,3) d(:,2)]';
data.y0 = [ d(1,3) d(1,2) ]';

%% optimize

theta0 = [ 0.1 0.05 0.1 0.01 0.1 ];

res = optimize_likelihood( theta0, data);

% options = optimset('PlotFcns',@optimplotfval);
% fun = @(theta) likelihood(theta,data);
% res = fminsearch(fun,theta0,options);


%%
a = res(1); b = res(2);
c = res(3); d = res(4);

F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];

tspan = [ data.t(1) data.t(end) ];

sol = ode45( F, tspan, data.y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

figure();

p = plot( data.t, data.y, '-o' );
set(p,'MarkerSize',10);
p(1).MarkerFaceColor = p(1).Color;
p(2).MarkerFaceColor = p(2).Color;

grid on
hold on

ax = gca;
ax.ColorOrderIndex = 1;

plot( t, y, '-', 'LineWidth', 3 )

legend('hare','lynx')
set(gca,'FontSize',20)
xlabel('time')
