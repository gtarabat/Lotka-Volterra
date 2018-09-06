% NOT FOR PYTHON

clear
close all

fig = figure(1);
fig.Color = [1 1 1]; 
fig.Position = [214 485 1936 853];
 

a = 0.5;
b = 0.01;
c = 0.1;
d = 0.01;

tspan = [0 100];
y0 = [ 30 ; 50 ];

F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];


% 45 23 113 15s 23s 23t 23tb 
sol = ode23s( F, tspan, y0 );

t = linspace( tspan(1), tspan(2), 5000)';
y = deval(sol,t);

subplot(1,2,1)
plot( y(1,:), y(2,:), '-', 'LineWidth', 3 )
axis([0 32 20 90])

grid on
hold on
xlabel('prey')
ylabel('predator')

set(gca,'FontSize',20)

subplot(1,2,2)
plot( t, y, '-', 'LineWidth', 3 )

hold on
grid on
xlabel('time')

legend('prey','predator')
set(gca,'FontSize',20)






%%


writerObj = VideoWriter('video-05','MPEG-4');
writerObj.FrameRate = 24;
open(writerObj);

for i=1:10:length(t)

    subplot(1,2,1)
    p1 = plot(y(1,i),y(2,i),'o');
    p1.MarkerSize = 14;
    p1.MarkerFaceColor = [0.9290    0.6940    0.1250];
    
    
    subplot(1,2,2)
    p2 = plot(t(i),y(1,i),'o');
    p2.MarkerSize = 14;
    p2.MarkerFaceColor = [0.9290    0.6940    0.1250];
    p2.HandleVisibility = 'off';
    
    p3 = plot(t(i),y(2,i),'o');
    p3.MarkerSize = 14;
    p3.MarkerFaceColor = [0.9290    0.6940    0.1250];
    p3.HandleVisibility = 'off';
    
    drawnow
    
    frame = getframe(gcf) ;    
    writeVideo(writerObj, frame);
    
    delete(p1)
    delete(p2)
    delete(p3)
    
    
end 


close(writerObj);