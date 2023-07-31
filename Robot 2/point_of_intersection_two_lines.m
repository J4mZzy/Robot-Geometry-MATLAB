function [w,r0] = point_of_intersection_two_lines(S1,S0L1,S2,S0L2)
%finds the intersection of two lines [S1;S0L1] [S2;S0L2]
%given:	[S1;S0L1] [S2;S0L2]
%outputs the intersection r0

S0L1 = S0L1/norm(S1);
S1 = unitVector(S1)';
S0L2 = S0L2/norm(S2);
S2 = unitVector(S2)';

w = 1-(dot(S1,S2))^2;
r0 = (cross(S2,S0L2)-dot(S1,S2)*cross(S1,S0L2)+dot(cross(S1,S0L1),S2)*S2)/w;

if w == 0 
    fprintf("two lines are parallel")
end
end