function [] = IC_Classifier(n,N)
% n = number of iterations of RK4
% N = resolution of Inertia Ellipsoid

[X,Y,Z] = ellipsoid(0,0,0,(2/1.4)^(0.5),(2)^(0.5),(2/0.7)^(0.5),N); %Energy ellipsoid
view(3)
s = surf(X,Y,Z,'FaceAlpha',0.25);   %plot energy ellipsoid
s.EdgeColor = 'None';
hold on

for i = 1:N     %loop over i coords of points in energy ellipsoid
    for j = 1:N     %loop over j coords of points in energy ellipsoid
        if (8*X(i,j)^2-3*Z(i,j)^2 < 0 && Z(i,j)>0)
            W = Simple_Modified_Euler(1.4,1,0.7,0.1,0.01,n,[X(i,j),Y(i,j),Z(i,j)]);
            if abs(W(3,n)) < 8*abs(W(1,n))/3
                p = plot3(X(i,j),Y(i,j),Z(i,j));
                p.Color = 'red';
                p.Marker = '.';
                p.MarkerSize = 10;
            end
        end
    end
end

W0 = [sqrt(1/56),0,sqrt(1/21)];
E0 = (1.4*W0(1)^2+W0(2)^2+0.7*W0(3)^2)/2; %Initial Energy IE
W0 = W0/sqrt(E0);   %Rescaling IC so that IE = 1
[~,W] = RK(0,W0,@(t,w) func(t,w,1.4,1,0.7),0.01,n);
plot3(W(1,:),W(2,:),W(3,:),'b');

W0 = [-sqrt(1/56),0,-sqrt(1/21)];
E0 = (1.4*W0(1)^2+W0(2)^2+0.7*W0(3)^2)/2; %Initial Energy IE
W0 = W0/sqrt(E0);   %Rescaling IC so that IE = 1
[~,W] = RK(0,W0,@(t,w) func(t,w,1.4,1,0.7),0.01,n);
plot3(W(1,:),W(2,:),W(3,:),'b');
