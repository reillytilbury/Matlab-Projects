function [s] = invert(p)
% This function inverts the permutation p
% The permutation p of {1,..,n} is represented by an n*1 vector
% Works by setting the p(i)^th index of s as i and then returning s

n = length(p);
s = zeros(n,1);    %initialising the output permutation

for i = 1:n
    s(p(i)) = i;
end

end

