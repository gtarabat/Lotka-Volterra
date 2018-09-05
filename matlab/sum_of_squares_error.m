function [ res, misc ] = sum_of_squares_error( theta, data)
 

F = @(t,y) [ y(1)*(theta(1)-theta(2)*y(2)) ; y(2)*(-theta(3)+theta(4)*y(1)) ];

tspan = [ data.t(1) data.t(end) ];

sol = ode45( F, tspan, data.y0 );

y = deval(sol,data.t);

dif = y - data.y;

res = sum(dif(:).^2);

misc = 0;
