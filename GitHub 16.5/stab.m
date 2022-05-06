function [C] = stab(a,B)
% a = elem of {1,2,..,n} whose stabiliser we will compute
% B = n*r matrix of generators
% C = n*s matrix of generators for stabilizer of a

n = length(B(:,1));     % n = sizze of set being permuted
r = length(B(1,:));     % r = num of generators for G
T = orb(a,B);           % T = orbit and witnesses
m = length([T{:,1}]);   % m = size of orbit
C = zeros(n,1);         % initialising C
k = 1;                  % k = counter for num of cols of C

% No complicated strategy here, we just store all possible elements of the
% set given in the question and then strip it using our Sims algorithm

for i = 1:r     % looping through generators of G
    for j = 1:m % looping through elems of T
        u = invert(phi(comp(B(:,i),T{j,2}),a,T));
        v = comp(B(:,i),T{j,2});
        C(:,k) = comp(u,v);
        k = k+1;
    end
end

[~,C] = Sims_Array(C);

end