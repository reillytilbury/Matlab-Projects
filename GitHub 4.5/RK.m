function [T,Y] = RK(a,b,f,h,n)

% T =[a,a+h,a+2h,..,a+nh]
% Y = RK approTimant on this interval
% a = T_0, 
% b = Y_0; 
% f = RHS of diff eqn, 
% h = step size, 
% n = No. of steps

k = zeros(length(b),4);
T = zeros(1,n+1);
Y = zeros(length(b),n+1);

T(1) = a;
Y(:,1) = b;

for i = 1:n
   T(i+1) = a+i*h;
   k(:,1)=h*f(T(i),Y(:,i));
   k(:,2)=h*f(T(i)+h/2,Y(:,i)+k(:,1)/2);
   k(:,3)=h*f(T(i)+h/2,Y(:,i)+k(:,2)/2);
   k(:,4)=h*f(T(i)+h,Y(:,i)+k(:,3));
   Y(:,i+1)=Y(:,i)+(k(:,1)+2*k(:,2)+2*k(:,3)+k(:,4))/6;
end

end