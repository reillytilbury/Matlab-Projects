function [] = Modified_Euler(A,B,C,k,h,n,W0)
% A,B,C: princ. moments of inertia
% h = step size in RK4
% n = no. of steps in RK4
% W0 = initial conditions
    
    E0 = (A*W0(1)^2+B*W0(2)^2+C*W0(3)^2)/2; %Initial Energy IE
    W0 = W0/sqrt(E0);   %Rescaling IC so that IE = 1

    [T,W] = RK(0,W0,@(t,w) modified_func(t,w,A,B,C,k),h,n);    %Numerical solution of W over time vector T
    [T,V] = RK(0,W0,@(t,w) func(t,w,A,B,C),h,n);    %Numerical solution of V over time vector T to undamped problem
    
    dx = max(W(1,:))-min(W(1,:));
    dy = max(W(2,:))-min(W(2,:));
    dz = max(W(3,:))-min(W(3,:));
    x = min(W(1,:)):(dx/5):max(W(1,:));
    y = min(W(2,:)):(dy/5):max(W(2,:));
    z = min(W(3,:)):(dz/5):max(W(3,:));
    [X,Y,Z] = meshgrid(x,y,z);
    
    E = (A*W(1,:).*W(1,:)+B*W(2,:).*W(2,:)+C*W(3,:).*W(3,:))/2; %Energy as func of time
    H = A^2*W(1,:).*W(1,:)+B^2*W(2,:).*W(2,:)+C^2*W(3,:).*W(3,:); % H as a func of time
    
    tiledlayout(2,2)
    
    ax1 = nexttile(1,[2 1]);
    view(3)
    hold on
    plot3(W(1,:),W(2,:),W(3,:));    %Plot of the solution found by numerical integration
    plot3(V(1,:),V(2,:),V(3,:));    %Plot of the solution found by numerical integration
    plot3(W0(1),W0(2),W0(3),'o','MarkerSize',10);   %Plot of the IC
    modified_vec_field(A,B,C,k,X,Y,Z); %Plot of Vec field
    xlabel("\omega_1");
    ylabel("\omega_2");
    zlabel("\omega_3");
    legend('\omega(t) (undamped)','\omega(t) (damped','\omega_0','d\omega/dt (damped)');
    title(ax1,'Phase Space Trajectory');
    
    ax2 = nexttile(2,[1 1]);
    hold on
    plot(T,V(1,:),'r',T,V(2,:),'g',T,V(3,:),'b',T,ones(length(T),1),T,H(1)*ones(length(T),1));   %Plot of Time Series
    xlabel("Time /s")
    ylabel("\omega")
    legend('\omega_1','\omega_2','\omega_3','Energy','Angular Momentum');
    title(ax2,'Time Series')
    
    ax3 = nexttile(4,[1 1]);
    hold on
    plot(T,W(1,:),'r',T,W(2,:),'g',T,W(3,:),'b',T,E,T,H);   %Plot of Time Series
    xlabel("Time /s")
    ylabel("\omega")
    legend('\omega_1','\omega_2','\omega_3','Energy','Angular Momentum');
    title(ax3,'Damped Time Series')
    
    E(n+1)-E(1)
    H(n+1)-H(1)
    W0
end

