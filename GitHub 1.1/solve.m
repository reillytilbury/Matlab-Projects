function [] = solve(n,y0,LineSpec)
% This function implements the ode45 ode solver to get solutions of
% Bessel's Equations.
% n = order of Bessel Equation
% y0 = [u,v] where u = y(1), v = y'(1), for our numerical soln y
[t,y] = ode45(@(x,y) bes(y,x,n),1:0.01:100,y0);  %Commencing forward integration
[s,z] = ode45(@(x,z) bes(z,x,n),1:-0.01:0.2,y0);  %Commencing backward integration
p1 = plot(t,y(:,1),LineSpec);       % plotting forwards soln
p2 = plot (s,z(:,1),LineSpec);      % plotting backwards soln
%legend([p1],{"x_0 = 1, y_0 = " + y0(1) + ", (dy/dx)_0 = " + y0(2)})