function [D0,S] = plane_defined_by_line_and_point(S1,S0L1,r0)
%define the plane with a line {S1; S0L1} and a point r0
%outputs the plane [D0,S] (unit vectorized)

D0 = dot(-r0,S0L1); 
S = S0L1-cross(r0, S1);
S_norm = norm(S);

D0 = D0/S_norm;
S = S/S_norm;

end