function l = line_of_intersection_two_planes(D01,D02,S1,S2)
%finds the line of intersection from two planes [S3;SOL3] 
%given:	[DO1 ; S1], [DO2; S2]
%outputs a line with the form [S3 (3 elements);SOL3 (3 elements)]

S3 = cross(S1,S2);
S0L3 = (-D02)*S1 - (-D01)*S2;
 
l = [S3;S0L3];

end