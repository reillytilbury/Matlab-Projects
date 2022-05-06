function f = func(T,W,A,B,C)
%This function is the RHS of Euler's Equations
%Although this func has no explicit T dependence, RK4 asks for a function
%of bot h x and T
    f = [(B-C)*W(2)*W(3)/A; (C-A)*W(1)*W(3)/B; (A-B)*W(1)*W(2)/C];
end