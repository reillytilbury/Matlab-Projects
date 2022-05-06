function [Y] = DFT(X,F,N)
% We take in a function F defined over a set [0, R] with very small
% stepsize. We then choose how many samples we want to take from this
% interval, N. higher N corresponds to higher sampling freq. 
% This is NOT the code used for Question 5, but rather code used to get an
% intuition for results and develop plots for some of the figures generated
% NOTE: N must divide length(X)-1

A = zeros(N,N); % A will be our DFT matrix
omega_N = exp(2*pi*1i/N);   % omega_N is the Nth root of unity
m = length(X);
step = (m-1)/N;
R = X(m);   % R is what the notes call X

for j = 0:N-1   % Now we define matrix A
    for k = 0:N-1
        A(j+1,k+1) = (R/N)*omega_N^(-j*k);
    end
end

% Next we take N evenly spaced samples from the vector F and compute its
% DFT Y.
U = X(1:step:m-step)';  % U is a column vector of our sampled x vals
V = F(1:step:m-step)';  % V is a column vector of our sampled y vals

Y = A*V;

L = floor(N/2);
B = zeros(N,N);
B(L+1:N,1:L) = eye(L);
B(1:L,L+1:N) = eye(L);

Y = B*Y;

% Next plot [0,1/X,2/X,...,(N-1)/X] and Y

freqs = (1/R).*(-L:L-1);

tiledlayout(1,2);

nexttile
hold on
plot(X,F);
scatter(U,V,40,'filled');
xlabel('x')
ylabel('y')

nexttile
hold on
bar(freqs,abs(Y),0.4);
xlabel('freq (hz)')
ylabel('|DFT|')

end