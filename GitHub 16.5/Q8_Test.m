%This script gives a set of generators for Q8 and allows us to use some of
%our functions on it. Note that a and b defined below satisfy a^4 = e,
%a^2 = b^2, aba = b 
a = [2;4;6;7;3;8;1;5];
b = [3;5;4;8;7;2;6;1];
c = comp(a,b);  %This isn't required to generate the group, but let's see
% if it gets removed!

[A,C] = Sims_Array([a,b]);  % calculating sims array and stripped generators

