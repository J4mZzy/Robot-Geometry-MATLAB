function [mm, a12_1, alpha12_1, a12d_1, a12_2, alpha12_2, a12d_2] = mutual_moment(S1,S0L1,S2,S0L2)
%finds the mutual moment of two lines from two lines [S1;S0L1] [S2;S0L2]
%given:	[S1;S0L1] [S2;S0L2]
%outputs the mutual moment, two cases of a12 unit vectors, alpha12 (in degrees), and the
%distance of a12

%if mm = 0, the two lines intersect

S0L1 = S0L1/norm(S1);
S1 = unitVector(S1)';
S0L2 = S0L2/norm(S2);
S2 = unitVector(S2)';


a12_1 =unitVector(cross(S1,S2));
a12_2 = -a12_1;

c = dot(S1,S2);
s_1 = dot(cross(S1,S2),a12_1);
s_2 = dot(cross(S1,S2),a12_2);

alpha12_1 = atan2d(s_1,c);
alpha12_2 = atan2d(s_2,c);

mm = dot(S1,S0L2)+dot(S2,S0L1);

a12d_1 = -mm/s_1;
a12d_2 = -mm/s_2;


end