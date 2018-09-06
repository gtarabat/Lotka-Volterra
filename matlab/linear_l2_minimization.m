clear
r = 1;
n = 20;
t = linspace(0,10,n);

y = r*t + 2*round(rand(1,n))-1 + randn(1,n) ;

close all
fig1 = figure(1);
fig1.Position = [399 1 882 704];


p = plot( t, y, 'o' );
set(p,'MarkerSize',10);
p.MarkerFaceColor = p.Color;

xlabel('time')
ylabel('population')
set(gca,'FontSize',20)

grid on
hold on

axis equal
saveas(gcf,'linear_data.eps','epsc')

%%
py = r*t;

fig2 = figure(2);
fig2.Position = [399 1 882 704];
tmp=plot(t,py);
tmp.LineWidth = 3;
tmp.Color = 'k';
grid on
xlabel('time')
ylabel('population')
set(gca,'FontSize',20)
saveas(fig2,'linear_model.eps','epsc')
close(fig2)

%%
c = [1 2 10 0.5 0.1 -2];

point = zeros(n,2);
for k=1:length(c)
    
    clear point

    yy = c(k)*r*t;
    vector = [t(1),yy(1) ; t(end),yy(end)];

    for i=1:n
        point(i,:) = projection_to_line(vector, [t(i),y(i)])';

        pp(i) = plot([t(i) point(i,1)],[ y(i) point(i,2)],'r-');
        pp(i).LineWidth = 2;
    end

    xt = [ min(point(:,1)) max(point(:,1))];
    xy = c(k)*r*xt;
    pl=plot( xt, xy );
    pl.Color = 'k';
    pl.LineWidth = 3;


    saveas(fig1,['linear_error_' num2str(k) '.eps'],'epsc')
    delete(pp);
    delete(pl);
end