function [] = diff_ics(c,n,save)
% This script will help us numerically solve Bessel's Equation of order n
% for 3 diff ICS, y(x0) = c, y'(x0) = {-1,0,1}
% save = 0 or 1, if save = 1 then save images

hold on     % This ensures all graphs displayed superimposed
solve(n,[c,1],'r')
solve(n,[c,0],'g')
solve(n,[c,-1],'b')
plot([0,100],[0,0],'k')  % Plot x axis in black
xlabel('x')
ylabel('y')
title("Numerical Solutions for n = " + n + ", y_0 = " + c)

if save == 1
    saveas(gcf,"testy"+c+"n"+n+".png")
    clf
end
end