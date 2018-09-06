clear
close all

figure(1)
 

a = 0.5;
b = 0.01;
c = 0.1;
d = 0.01;

tspan = [0 100];
Y0 = [ 20 25 30 35 40 45 50 55 60 65 ; 50 50 50 50 50 50 50 50 50 50  ];

F = @(t,y) [ y(1)*(a-b*y(2)) ; y(2)*(-c+d*y(1)) ];


for i = 1:size(Y0,2)
    
    y0 = Y0(:,i);
    
    % 45 23 113 15s 23s 23t 23tb 
    sol = ode23s( F, tspan, y0 );

    t = linspace( tspan(1), tspan(2), 5000)';
    y = deval(sol,t);

    subplot(1,2,1)
    plot( y(1,:), y(2,:), '-', 'LineWidth', 3 )
    axis([0 70 10 140])
    
    grid on
    hold on
    xlabel('prey')
    ylabel('predator')

    set(gca,'FontSize',20)
    
    subplot(1,2,2)
    plot( t, y, '-', 'LineWidth', 3 )
    
    grid on
    xlabel('time')
    
    
    legend('prey','predator')
    set(gca,'FontSize',20)
    
    % press enter
    pause();
    
end