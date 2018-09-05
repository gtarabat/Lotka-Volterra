clear

a = 0.5;
b = 0.01;
c = 0.1;
d = 0.01;
e = 0.01; % try this value 0.1
f = 0.5;
g = 0.01;

tspan = [0 50];
y0 = [ 10 ; 25; 5 ];
F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)-e*y(3)) ; y(3)*(-f+g*y(2)) ];



sol = ode23s( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


% PLOT

figure(1); close all

% just plot
% plot( t, y, '-', 'LineWidth', 3 )

axis([0 50 0 140])
xlabel('time')
set(gca,'FontSize',20)
grid on

%%
% animated plot
h1 = animatedline('LineWidth',3,'Color', [0, 0.4470, 0.7410] );
h2 = animatedline('LineWidth',3,'Color', [0.8500, 0.3250, 0.0980] );
h3 = animatedline('LineWidth',3,'Color', [0.9290, 0.6940, 0.1250] );

addpoints(h1,t(1),y(1,1));
addpoints(h2,t(1),y(2,1));
addpoints(h3,t(1),y(3,1));
legend('mouse','snake','owl')

for k = 1:10:length(t)
    addpoints(h1,t(k),y(1,k));
    addpoints(h2,t(k),y(2,k));
    addpoints(h3,t(k),y(3,k));
    drawnow
end






% animated plot


