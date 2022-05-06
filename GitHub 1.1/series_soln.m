function [X,J] = series_soln(n,range,h,eps)
% This function truncates a sum of the series solution of Bessel's equation
% of order n. The number of terms is chosen to ensure that within
% [0,range], the error is bounded by the input eps. Here h represents the
% resolution we want to view our domain in

N = floor(range/2)-2;
a = (0.5*range)^(2*(N+1)+n)/(factorial(N+1)*factorial(N+n+1));

while a > eps
    N = N+1;
    a = ((0.5*range))^(2*(N+1)+n)/(factorial(N+1)*factorial(N+n+1));
end

% Next we compute the solution J
X = 0:h:range;  % these are the x vals at which we evaluate our series soln
J = 0.*X;       % initialising soln
k = 2;          % k will index the values of our solution J at X value X(k)

for i = h:h:range% i loops through all values in domain we wish to calculate
    
    for j = 0:N     % j adds each term in the series we wish to calculate
        
        taylor_term = (-1)^(j)*(i/2)^(2*j+n)/(factorial(j)*factorial(n+j));
        J(k) = J(k) + taylor_term;
        
    end
    
k = k+1;

end

plot(X,besselj(n,X),X,J)
xlabel('x')
ylabel('y')
title("Series Solution plot for n = "+n+", X = "+range+", h = "+h+", epsilon = "+eps+".")
N

end
