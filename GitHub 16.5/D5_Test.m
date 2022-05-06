r = [5;1;2;3;4];    % r is a rotation of 2pi/5
q = [1;2;3;4;5];    % q = id
B = zeros(5,10);    % initialising all elems of D5

for i = 1:5
    q = comp(q,r);  % generating successive rotations
    B(:,i) = q;     % storing successive rotations
end

q = [1;5;4;3;2];    % now an arb reflection takes role of id above as we
                    % generate all reflections

for i = 1:5
   q = comp(q,r);   % generating successive reflections
    B(:,i+5) = q;   % storing successive reflections
end

[A,C] = Sims_Array(B);  % calculating sims array and stripped generators