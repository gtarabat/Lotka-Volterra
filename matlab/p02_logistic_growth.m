clear; close all


r = 0.4;    % rate
K = 100;    % maximum population, capacity

tspan = [ 0 40 ];
y0 = 10;
F = @(t,y) r*y*(1-y/K);

sol = ode45( F, tspan, y0 );



% make data 
figure(1)

t = linspace( tspan(1), tspan(2), 30)';
y = deval(sol,t);
y = y + 0.05*y.*rand(1,30);

p = plot( t, y, 'o--', 'LineWidth', 1 );
set(p,'MarkerSize',10);
p.MarkerFaceColor = p.Color;
grid on

xlabel('time')
ylabel('population')
set(gca,'FontSize',20)
drawnow



%%
t = linspace( tspan(1), tspan(2), 1000)';
y = deval(sol,t);


fig = figure(1); clf
fig.Color = [1 1 1];
axis([0 20 0 200])
hold on
grid on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)


writerObj = VideoWriter('video-02','MPEG-4');
writerObj.FrameRate = 24;
open(writerObj);


p=plot(0,y0,'o');
p.MarkerSize = 10;
p.MarkerFaceColor = p.Color; 

frame = getframe(gcf) ;    
writeVideo(writerObj, frame);

pause(1)

% ---- just plot
%     plot( t, y, '-', 'LineWidth', 3, 'Color',p.Color )

% ---- animated plot
h = animatedline('LineWidth',3,'Color',p.Color);

for k = 1:10:length(t)
    addpoints(h,t(k),y(k));
    drawnow
    
    frame = getframe(gcf) ;    
    writeVideo(writerObj, frame);
end

close(writerObj);


pause

%% Run for many initial conditions

fig=figure(2); clf
fig.Color = [1 1 1];
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

writerObj = VideoWriter('video-03','MPEG-4');
writerObj.FrameRate = 24;
open(writerObj);

for i=1:length(y0)
    
    sol = ode45( F, tspan, y0(i) );
    y = deval(sol,t);
   
    p=plot(0,y0(i),'o');
    p.MarkerSize = 10;
    p.MarkerFaceColor = p.Color;
 
    frame = getframe(gcf) ;    
    writeVideo(writerObj, frame);
    
    pause(0.5)
    
    % ---- just plot
%     plot( t, y, '-', 'LineWidth', 3, 'Color',p.Color )
    
    % ---- animated plot
    h = animatedline('LineWidth',3,'Color',p.Color);

    for k = 1:50:length(t)
        addpoints(h,t(k),y(k));
        drawnow
        
        frame = getframe(gcf) ;    
        writeVideo(writerObj, frame);
    end
    
 
    pause(0.5)
end

close(writerObj);

