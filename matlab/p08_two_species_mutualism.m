clear

a = 0.3;
b = 0.0011;
c = 0.01;
d = 0.4;
e = 0.01;
f = 0.0;

tspan = [0 1000];
y0 = [ 40 ; 20 ];
F = @(t,y) [ y(1)*( a - b*y(1) - c*y(2) ) ; y(2)*( -d + e*y(1) - f*y(2) ) ];



sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 50000)';
y = deval(sol,t);


% PLOT

figure(1);

% just plot
plot( t, y, '-', 'LineWidth', 3 )


xlabel('time')
ylabel('population')
set(gca,'FontSize',20)
grid on
legend('prey','predator')
axis tight

saveas(gcf,'three_species.eps','epsc')

%%
figure(2);

plot( y(1,:), y(2,:), '-', 'LineWidth', 3 )

xlabel('prey')
ylabel('pradator')
set(gca,'FontSize',20)
grid on
axis tight

saveas(gcf,'three_species_phase.eps','epsc')

