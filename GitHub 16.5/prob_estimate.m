function [p] = prob_estimate(n,m)
% n = num of elements we are permuting
% m = num of random pairs we are creating

B = zeros(n,2*m);   % B stores random perms in cols, we have m pairs, with 
% pair i in cols 2i-1 and 2i
s = 0;  % s = num of pairs which generate all of S_n

for i = 1:2*m
    B(:,i) = rp(n);
end

for i = 1:m
    if order(B(:,[2*i-1,2*i])) == factorial(n)
        % this condition checks if the ith random pair generates all of
        % S_n. If the answer is yes, then increment s.
        s = s+1;
    end
end

p = s/m;    % p is the empirical probability estimate

end