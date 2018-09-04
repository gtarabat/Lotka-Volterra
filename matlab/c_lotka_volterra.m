figure(1)

a = 0.5;
b = 10;
c = 0.1;
d = 10;

tspan = [0 100];
y0 = [10 ; 20];
F = @(t,y) [ a*y(1)*(1-y(2)/b) ; -c*y(2)*(1-y(1)/d) ];


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

plot( t, y, '-', 'LineWidth', 3 )
grid on

xlabel('time')

