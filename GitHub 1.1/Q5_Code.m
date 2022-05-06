function [] = Q5_Code(X,n,N,save)
% X is the set of input values, will usually be some interval [0,R]
% n is the order of the Bessel Function
% N is the number of samples we take. Needs to be even.
% if save == 1, we save the image

m = length(X);  % This shorthand variable will come in handy later
F = besselj(n,X);   % Bessel func of first kind, order n, evaluated at X
R = X(m);   % R is what notes call X
% F = 3*sin(X) + 4*sin(2*X); % This is just here to test everything
x_step = floor(m/N);    % this is not delta_x, but rather the number of entries
% we have to skip when we are sampling F
V = F(1:x_step:m);   % V is our sampled signal
V(1) = 0.5*(V(1)+V(N+1)); % Always need to do this as interval sym abt 0
V = V(1:N);

% Next we will need to build the matrix to rearrange the DFT vector
B = zeros(N,N);
L = N/2;
B(L+1:N,1:L) = eye(L);
B(1:L,L+1:N) = eye(L);

ft_F = fft(V);    % FT of F, evaluated at (-N/2X),(-N/2X + delta_k), ...
ft_F = B*(ft_F)';   % This cyclically permutes the vector N/2 steps forward
if mod(n,2) == 1
    ft_F = 2*imag(ft_F);  % Since the domain of F is [-R,R], we have to do this
else
    ft_F = 2*real(ft_F);  % Since the domain of F is [-R,R], we have to do this
end

ft_F = (R/N).*ft_F;

delta_k = 1/R;  % Step size in freq domain
freqs = -(N/(2*R)):delta_k:(N-1)/(2*R); % Frequency domain

% Next, we define T, the theoretical formula for the FT of J_n
T = 0.*freqs';

i = 1;   %This will be our counter
for k = freqs
    if abs(k) >= 1/(2*pi)
        T(i) = 0;
    else
    T(i) = ((2*(-1i)^n)*(1-(2*pi*k)^2)^(-0.5))*chebyshevT(n,2*pi*k);
    end
    i = i+1;
end

plot(freqs,abs(ft_F),freqs,abs(T),'--');
xlabel('k (hz)')
ylabel('|FT|')
legend('Discrete Fourier Transform','Fourier Transform');
er_vec = abs(abs(T)-abs(ft_F));
error = er_vec(N/2 + 1);   % This is Error at 0
title("X = "+ R +", n = "+n+", N = "+N+", Error = "+error);

if save == 1
    saveas(gcf,"X"+R+"n"+n+"N"+N+".png")
    clf
end

end