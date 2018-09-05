clear
figure(1)

a = 0.5;
b = 10;
c = 0.1;
d = 10;

tspan = [0 100];
Y0 = [10 30 1 9 5 10.1 25 20 ; 20  10 10 9 10 10.1 10 10];

F = @(t,y) [ a*y(1)*(1-y(2)/b) ; -c*y(2)*(1-y(1)/d) ];


for i = 1:size(Y0,2)
    
    y0 = Y0(:,i);
    
    % 45 23 113 15s 23s 23t 23tb 
    sol = ode23s( F, tspan, y0 );

    t = linspace( tspan(1), tspan(2), 5000)';
    y = deval(sol,t);

    subplot(1,2,1)
    plot( y(1,:), y(2,:), '-', 'LineWidth', 3 )
    
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