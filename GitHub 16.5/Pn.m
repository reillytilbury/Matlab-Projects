%This script creates a vector v st v(i) is the approx probability of 2
%random perms generating S_i. We do this 10 times and then plot all vectors
%against n

hold on
for j = 1:11
    v = zeros(1,12);    %initialise v

    for i = 1:12
        v(i) = prob_estimate(i,100);
    end

    plot(1:12,v);
end