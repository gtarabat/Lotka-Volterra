clear


r = 0.4;

tspan = [0 20];
y0 = 1;
F = @(t,y) r*y - t*y + t;

sol = ode45( F, tspan, y0 );

% synthetic data
figure(1)

t = linspace( tspan(1), tspan(2), 30)';
y = deval(sol,t);
y = y + 0.02*randn(1,30);

p = plot( t, y, 'o--', 'LineWidth', 1 );
% set(p,'MarkerSize',10);
p.MarkerFaceColor = p.Color;
grid on
hold on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)
drawnow


%%
sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

fig=figure(1);
fig.Color = [1 1 1];
grid on
hold on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)

% ---- plot
plot( t, y, '-', 'LineWidth', 3 )
