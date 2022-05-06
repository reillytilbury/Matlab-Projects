function f = modified_func(T,W,A,B,C,k)
%Although this func has no explicit T dependence, RK4 asks for a function
%of bot h x and T
    f = [((B-C)*W(2)*W(3)-k*W(1))/A; ((C-A)*W(1)*W(3)-k*W(2))/B; ((A-B)*W(1)*W(2)-k*W(3))/C];
end