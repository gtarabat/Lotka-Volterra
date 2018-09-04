figure(1)

r = 0.4;
K = 100;

tspan = [0 30];
y0 = 10;
F = @(t,y) r*y*(1-y/K);


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


plot( t, y, '-', 'LineWidth', 3 )
grid on

xlabel('time')

%% Run for many initial conditions

figure(2)

r = 0.4;
K = 100;

tspan = [ 0 20 ];
y0 = [ 1 5 10 15 30 50 70 90 100 110 130 150 170 190 ]';
F = @(t,y) r.*y.*(1-y/K);

sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

plot( t, y, '-', 'LineWidth', 3 )
grid on

xlabel('time')
