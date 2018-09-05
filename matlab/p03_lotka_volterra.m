clear

a = 0.5;
b = 0.01;
c = 0.1;
d = 0.01;


tspan = [0 100];
y0 = [ 10 ; 25 ];
F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];



sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


% PLOT

figure(1);
axis([0 100 0 90])
xlabel('time')
set(gca,'FontSize',20)
grid on

% just plot
% plot( t, y, '-', 'LineWidth', 3 )

%%
% animated plot
h1 = animatedline('LineWidth',3,'Color','red');
h2 = animatedline('LineWidth',3,'Color','black');

addpoints(h1,t(1),y(1,1));
addpoints(h2,t(1),y(2,1));
legend('prey','predator')

for k = 1:10:length(t)
    addpoints(h1,t(k),y(1,k));
    addpoints(h2,t(k),y(2,k));
    drawnow
end






% animated plot


