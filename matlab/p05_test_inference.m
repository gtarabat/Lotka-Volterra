clear
close all

a = 0.5;
b = 0.028;
c = 0.85;
d = 0.02;

y0 = [30 ; 4];

% make synthetic data
tspan = [0 20];
F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];

sol = ode45( F, tspan, y0 );

n = 20;
data.t = linspace( tspan(1), tspan(2), n)';
data.y = deval(sol,data.t) + 1*randn(2,n);
data.y0 = y0;

figure(1)

plot( data.t, data.y, 'o-', 'LineWidth', 3 )
grid on

xlabel('time')
legend('prey','predator')
set(gca,'FontSize',20)
drawnow

%% optimize

theta0 = [ 0.1 0.05 0.1 0.05 ];

res = optimize( theta0, data);

% options = optimset('PlotFcns',@optimplotfval);
% fun = @(theta) likelihood(theta,data);
% res = fminsearch(fun,theta0,options);


%%
a = res(1); b = res(2);
c = res(3); d = res(4);

F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];

sol = ode45( F, tspan, y0 );

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

xlabel('time')
legend('prey','predator')
set(gca,'FontSize',20)
