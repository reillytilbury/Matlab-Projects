function [s] = comp(p,q)
%This function composes the permutations p and q to return p*q
%The permutations p,q of {1,..,n} are represented by n*1 vectors, with p(i)
% = the value of i under the permutation p

n = length(p);
s = zeros(n,1);    %initialising the output permutation

for i = 1:n
    s(i) = p(q(i));
end
end

