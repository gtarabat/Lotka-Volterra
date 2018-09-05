clear; close all


r = 0.4;    % rate
K = 100;    % maximum population, capacity

tspan = [ 0 20 ];
y0 = 10;
F = @(t,y) r*y*(1-y/K);

sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 1000)';
y = deval(sol,t);


figure(1)
axis([0 20 0 200])
hold on
grid on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)

p=plot(0,y0,'o');
p.MarkerSize = 10;
p.MarkerFaceColor = p.Color; 

pause

% ---- just plot
%     plot( t, y, '-', 'LineWidth', 3, 'Color',p.Color )

% ---- animated plot
h = animatedline('LineWidth',3,'Color',p.Color);

for k = 1:1:length(t)
    addpoints(h,t(k),y(k));
    drawnow
end



pause

%% Run for many initial conditions

figure(2); clf
axis([0 20 0 200])
hold on
xlabel('time')
set(gca,'FontSize',20)
grid on    

r = 0.4;
K = 100;

y0 = [ 1 5 10 15 30 50 70 90 100 110 130 150 170 190 ]';
F = @(t,y) r.*y.*(1-y/K);

t = linspace( tspan(1), tspan(2), 5000)';

for i=1:length(y0)
    
    sol = ode45( F, tspan, y0(i) );
    y = deval(sol,t);
   
    p=plot(0,y0(i),'o');
    p.MarkerSize = 10;
    p.MarkerFaceColor = p.Color;
 
    pause
    
    % ---- just plot
%     plot( t, y, '-', 'LineWidth', 3, 'Color',p.Color )
    
    % ---- animated plot
    h = animatedline('LineWidth',3,'Color',p.Color);

    for k = 1:50:length(t)
        addpoints(h,t(k),y(k));
        drawnow
    end
    
 
    pause
end



