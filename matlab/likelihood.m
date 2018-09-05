function [ res, misc ] = likelihood( theta, data)
 

F = @(t,y) [ y(1)*(theta(1)-theta(2)*y(2)) ; y(2)*(-theta(3)+theta(4)*y(1)) ];

tspan = [ data.t(1) data.t(end) ];

sol = ode45( F, tspan, data.y0 );

y = deval(sol,data.t);

dif = y - data.y;


N = length(dif(:));

sigma = theta(5);


sse = sum(dif(:).^2);
res = - 0.5*N*( log(2*pi) + 2*log(sigma) ) - 0.5*sse/(sigma^2) ;

res = - res;

misc = 0;
