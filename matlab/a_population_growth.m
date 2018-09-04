figure(1)
r = 0.4;

tspan = [0 10];
y0 = 2;
F = @(t,y) r*y;


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


plot( t, y, '-', 'LineWidth', 3 )
grid on

xlabel('time')


%%
hold on

r = -0.4;

tspan = [0 10];
y0 = 100;
F = @(t,y) r*y;


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


plot( t, y, '-', 'LineWidth', 3 )
grid on

xlabel('time')