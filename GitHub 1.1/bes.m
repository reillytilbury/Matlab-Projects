function [d] = bes(y,x,n)
% When we write Bessel's Equation down as a system of 1st order ODES we
% have: u = y, v = y'. We then have eqns:
% u' = v
% v' = ((n^2 - x^2)u -xv)/(x^2).
% In our scheme, y(1) = u, y(2) = v, x = x and order = n
% The vector d(x,y) = [u'(x), v'(x)] = [y'(x), y''(x)]
d = [y(2); ((n^2-x^2)*y(1)-x*y(2))/x^2];
end

