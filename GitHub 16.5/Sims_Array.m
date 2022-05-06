function [A,C] = Sims_Array(B)
% B is an n*k matrix whose columns are perms generating some G < S_n
% C is an n*r matrix (r<=k) which reduces the generating set to a smaller
% generating set by removing redundancy

if isempty(B) == 0  
    n = length(B(:,1)); %num of elems in column of B = n
    k = length(B(1,:)); %num of elements in original generating set = num rows
    A = NaN(n,n,n); %A is our Sims array

    for i = 1:k     %we now loop through col 1 of B and put them in the array A
        j = 1;  %j is just a counter
        while (j <= n)  %j counts which row we are in, only care about j <= n
            if(min(isnan(A(j,B(j,i),:))) == 1 && B(j,i) ~= j)  
                %This is a slick way of checking if entry A(j,B(j,i),:) is
                %empty. isnan returns an array of 0s and 1s and if all 1s it is
                %empty. Also checking B(:,i) doesn't fix j
                A(j,B(j,i),:) = B(:,i); %Assignment
                break   
                %Done job of assigning B(:,i) so break out of while loop and
                %move on to next element
            elseif (max(isnan(A(j,B(j,i),:))) == 0)
                %This condition checks if there is a vector in A(j,B(j,i),:)
                g = squeeze(A(j,B(j,i),:)); 
                %This just removes dimensions of length 1, sets this perm = g
                B(:,i) = comp(invert(g),squeeze(B(:,i)));
            end
            j = j+1;
        end
    end

    %Next we want to retrieve all nonempty vectors in A and place these in the
    %columns of C

    C=[];   %Initialising C, this ensures that if B = [id], then C = [empty]
    j = 1;  %Reinitialising counter

    %loop through each element in the array and see if it contains a perm
    for i = 1:n     
        for h = 1:n
            if(max(isnan(A(i,h,:))) == 0)
                %we need all entries of isnan(A) == 0 so that we can say
                %there's a vector inside A(i,j,:)
                C(:,j) = squeeze(A(i,h,:));
                j = j+1;
            end
        end
    end
else 
    A = [];
    C = [];
end
end
