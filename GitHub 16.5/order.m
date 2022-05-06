function [m] = order(B)
% B is an n*r matrix whose cols are generators of some group G
% m is a vector whose entries are all orders of the subgroups we compute
% in descending order

    u = []; % u is a vector whose kth entry is the size of the orbit of k 
    % in the subgroup G_1 intersect G_2 intersect ... intersect G_k-1
    v = []; % v is a matrix w/ 2 cols and as many rows as entries in u, it
    % stores in col 1 the size of gen set for subgrp before stripping and 
    % in col 2 after stripping
    k = 1;  % counter
    
    % strategy: find stabiliser of 1 in G, stabiliser of 2 in G_1,
    % stabiliser of 3 in G_1 and G_2, and so on. Eventually, we get the
    % trivial group, by calculating the sizes of these stabilisers and
    % using the orbit stabiliser theorem, and then multiplying these
    % together, we get the otder of G and the order of all these subgroups
    % in the process
    
    
    while isempty(B) == 0
        [u(k), ~] = size(orb(k,B)); % size of orbit
        B = stab(k,B); % set B = new set of generators for next subgrp
        v(k,1) = size(B,2);     % retrieve no. cols of B (ie num generators)
        [~, B] = Sims_Array(B); % strip B
        v(k,2) = size(B,2);     % retrieve no. cols of B (ie num generators)
        k = k+1;
    end
    
    t = length(u);  % t is the num of steps we have gone through
    m = zeros(1,t); % initialise m, vector of all subgroup sizes
    
    for i = 1:t
        m(i) = prod(u(i:t));    %m(1) = u_1*..u_t, m(2) = u_2*.._u_t, ...
    end
    
end