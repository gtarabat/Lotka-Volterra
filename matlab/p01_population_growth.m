clear


r = 0.4;

tspan = [0 10];
y0 = 2;
F = @(t,y) r*y;


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

close all
figure(1)
grid on
hold on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)

% ---- plot
% plot( t, y, '-', 'LineWidth', 3 )

% ---- animated plot
h = animatedline('LineWidth',3);
axis([0,10,0,120])


for k = 1:10:length(t)
    addpoints(h,t(k),y(k));
    drawnow
end






%%
hold on

r = -0.4;

tspan = [0 10];
y0 = y(end); % start from the final population of the previous example
F = @(t,y) r*y;


sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);


% ---- plot
% plot( t, y, '-', 'LineWidth', 3 )

% ---- animated plot
h = animatedline('LineWidth',3,'Color','red');


for k = 1:10:length(t)
    addpoints(h,t(k),y(k));
    drawnow
end
