clc; clear;
%% problem 6(a)]
fprintf("Problem 6\n")

r1 = [-2,4,3];
r2 = [2,-8,0];
r3 = [1,-3,5];
r4 = [4,1,-7];

%%line defined by two points
S1 = r2 - r1;
S0L1 = cross(r1,S1);

S2 = r4 - r3;
S0L2 = cross(r3,S2);

[~, ~, ~, a12d_1, ~, ~, ~] = mutual_moment(S1,S0L1,S2,S0L2);
fprintf("(a) the shortest (perpendicular) distance is %0.4f m\n\n",abs(a12d_1))

%% problem 13
fprintf("Problem 13\n")
r_ca = [0.45339,0.84633,-0.27959];
r_co = [0.29892, -0.93611,-0.18533];
r_oa = [0,300,0];
r_o = [0,0,0];
S1 = r_ca;
S2 = r_co;
S0L1 = cross(r_oa,S1);
S0L2 = cross(r_o,S2);
fprintf("(a) two lines in Plucker coordinates are: \n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}, {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S1(1),S1(2),S1(3),S0L1(1),S0L1(2),S0L1(3),S2(1),S2(2),S2(3),S0L2(1),S0L2(2),S0L2(3));

[mm, ~, ~, a12d_1, ~, ~, ~] = mutual_moment(S1,S0L1,S2,S0L2);
fprintf("(b) the shortest (perpendicular) distance is %0.4f m\n",abs(a12d_1))

%note that mm ~= 0, the two lines don't intersect
[l,rE1,rE2] = perpendicular_line_to_two_lines(S1,S0L1,S2,S0L2);
midpoint = rE1 + 1/2*norm(rE2-rE1)*unitVector(rE2-rE1)';

fprintf("(c) the the midpoint of the line segment that is perpendicular to the two lines is (%0.4f, %0.4f, %0.4f) unit(m) \n",midpoint(1),midpoint(2),midpoint(3))


