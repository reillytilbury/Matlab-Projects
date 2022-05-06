function [D] = orb(a,B)
% Q5 is a nice opportunity to work with cell arrays! 
% Cell arrays are good when we want to store information of different data
% types in an array
% D is a cell array with col 1 giving elems of orbits and corresponding row
% in col 2 giving witnesses
% B = set of generators of G
% a = element of {1,2,...,n} whose orbit we wish to compute
    
    n = length(B(:,1));     % n is the size of the set we are permuting
    r = length(B(1,:));     % r is the number of generators
    D = {a,(1:n)'};         % The identity clearly sends a to a
    [k,~] = size(D);        % k = size of orbit computed thus far
    i = 1;                  % initialising counter
    
    while i <= k        
        % This condition ensures that the while loop terminates when we
        % go through our currently computed orbit, apply our generating set
        % to it and this doesn't generate any new orbit elements
        for j = 1:r     % looping over all cols in B
            if ismember(B(D{i,1},j),[D{:,1}]) == 0   
                %This if statement takes an element in the orbit, applies a
                %generator to it and sees if the resulting element is
                %already in the orbit. If not, we add it and its witness,
                %then we repeat the process on this element. We continue
                %until this method doesn't generate anything new
                D{k+1,1} = B(D{i,1},j);     %add new orb elem
                D{k+1,2} = comp(B(:,j),D{i,2});     %add new witness
                [k,~] = size(D);    %increment k
            end
        end
        i = i+1;
    end

end