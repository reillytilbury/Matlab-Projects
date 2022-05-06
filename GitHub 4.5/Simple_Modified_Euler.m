function [W] = Simple_Modified_Euler(A,B,C,k,h,n,W0)
% A,B,C: princ. moments of inertia
% h = step size in RK4
% n = no. of steps in RK4
% W0 = initial conditions
    
    E0 = (A*W0(1)^2+B*W0(2)^2+C*W0(3)^2)/2; %Initial Energy IE
    W0 = W0/sqrt(E0);   %Rescaling IC so that IE = 1

    [~,W] = RK(0,W0,@(t,w) modified_func(t,w,A,B,C,k),h,n);    %Numerical solution of W over time vector T
end