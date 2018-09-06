clear


r = 0.4;

tspan = [0 10];
y0 = 2;
F = @(t,y) r*y;


sol = ode45( F, tspan, y0 );


% synthetic data
figure(1)

t = linspace( tspan(1), tspan(2), 20)';
y = deval(sol,t);
y = y + 0.5*y.*rand(1,20);

p = plot( t, y, 'o--', 'LineWidth', 1 );
set(p,'MarkerSize',10);
p.MarkerFaceColor = p.Color;
grid on

xlabel('time')
ylabel('population')
set(gca,'FontSize',20)
drawnow




%%
sol = ode45( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

close all
fig=figure(1); clf
fig.Color = [1 1 1];
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

writerObj = VideoWriter('video-01','MPEG-4');
writerObj.FrameRate = 24;
open(writerObj);

for k = 1:20:length(t)
    addpoints(h,t(k),y(k));
    drawnow
    
    frame = getframe(fig) ;    
    writeVideo(writerObj, frame);
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


for k = 1:20:length(t)
    addpoints(h,t(k),y(k));
    drawnow
    
    frame = getframe(gcf) ;    
    writeVideo(writerObj, frame);
end



close(writerObj);
