function [h] = phi(g,a,D)
% g = elem. of G (n*1)
% a = elem. of {1,2,..,n} (1*1)
% D = orb. of a with witnesses (1*2 cell)
b = g(a);   % b is the value of g(a), b in {1,2,..,n}
k = find([D{:,1}]==b);  % k = row index of b in orbit
h = D{k,2};
end
