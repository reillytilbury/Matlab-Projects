function [v] = rp(n)
% n = size of random perm we are generating
% we will choose random elements of u, then remove them and start again
% until v is full (ie: u is empty)

u = (1:n)'; 
v = zeros(1,n)';
k = 1;  %counter

while isempty(u) == 0 %Check if u empty
    m = length(u);  
    v(k) = u(randi(m)); % choose random elem from u and assign to v
    u = u(u ~= v(k));   % remove randomly chosen elem from u
    k = k+1;
end

end