function [W,delta_E,delta_H] = Euler(A,B,C,h,n,W0)
% This code runs a numerical solution and creates various visualisations of
% important data to qualitatively understand the dynamics of Euler's
% Equations in phase space and in time series. It allows us to calculate
% the difference in energy and angular momentum from beginning to end to
% confirm whether or not our numerical simulations preserve these. Code
% also calls our Rk-4 solver and our vector field plotter. Later we
% introduce modified versions of this code to introduce a damping factor.

% A,B,C: princ. moments of inertia
% h = step size in RK4
% n = no. of steps in RK4
% W0 = initial ccpnditions
% W = Numerical Solution

    [X,Y,Z] = ellipsoid(0,0,0,(2/A)^(0.5),(2/B)^(0.5),(2/C)^(0.5));
    % This is the Energy ellipsoid

    E0 = (A*W0(1)^2+B*W0(2)^2+C*W0(3)^2)/2; %Initial Energy IE
    W0 = W0/sqrt(E0);   %Rescaling IC so that IE = 1

    [T,W] = RK(0,W0,@(t,w) func(t,w,A,B,C),h,n);    %Numerical solution of W over time vector T

    E = (A*W(1,:).*W(1,:)+B*W(2,:).*W(2,:)+C*W(3,:).*W(3,:))/2; %Energy as func of time
    H = A^2*W(1,:).*W(1,:)+B^2*W(2,:).*W(2,:)+C^2*W(3,:).*W(3,:); % H as a func of time
    
    tiledlayout(1,2)    %This ensures that our output is nicely formatted
    
    ax1 = nexttile;
    view(3)
    hold on
    plot3(W(1,:),W(2,:),W(3,:));    %Plot of the solution found by numerical integration in phase space
    plot3(W0(1),W0(2),W0(3),'o','MarkerSize',10);   %Plot point of the IC
    s = surf(X,Y,Z,'FaceAlpha',0.25);   %Plot of Energy Ellipsoid in phase space
    s.EdgeColor = 'None';
    vec_field(A,B,C,X,Y,Z); %Plot of Vec field
    xlabel("\omega_1");
    ylabel("\omega_2");
    zlabel("\omega_3");
    legend;
    title(ax1,'Phase Space Trajectory');
    
    ax2 = nexttile;
    hold on
    plot(T,W(1,:),'r',T,W(2,:),'g',T,W(3,:),'b');   %Plot of Time Series
    xlabel("Time /s")
    ylabel("\omega")
    legend;
    title(ax2,'Time Series')
    
    delta_E = E(n+1)-E(1);
    delta_H = H(n+1)-H(1);
end

