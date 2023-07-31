function [l,rE1,rE2] = perpendicular_line_to_two_lines(S1,S0L1,S2,S0L2)
%finds the finds the Unique Perpendicular Line to Two Given Lines [S1;S0L1] [S2;S0L2]
%given:	[S1;S0L1] [S2;S0L2]
%outputs a Unique Perpendicular Line to Two Given Lines with the form [S3;SOL3]
%the vector a12 can be checked by using unitVector(rE2-rE1)' ,a12 distance can be checked by norm(rE2-rE1) 
%rE1 on S1, rE2 on S2

a12 =unitVector(cross(S1,S2))';
s_alpha12 = dot(cross(S1,S2),a12);
a12d = -(dot(S1,S0L2) + dot(S2,S0L1))/s_alpha12;

if S0L1 == 0
    fprintf("S0L1 is 0, the first line passes thorugh the origin.")
    if s_alpha12 ~= 0
        rE1 = dot(S0L2,a12)/s_alpha12*S1;
        rE2 = rE1 + a12d*a12;
    elseif s_alpha12 == 0
        rE1 = [0,0,0];
        rE2 = cross(S2,S0L2)/dot(S2,S2);
    end
elseif S2 == 0
    fprintf("S2 is 0, the second line is at infinity.")
elseif dot(S0L1,S2) == 0
    fprintf("S0L1 and S2 are perpendicular")
    r1 = dot(S0L2,a12)/s_alpha12;
    r2 = dot(-S0L1,a12)/s_alpha12;
    rE1 = r1*S1 + r2*S2;
    rE2 = rE1 + a12d*a12; 
else
    rE1 = cross(S0L1,(S0L2-a12d*cross(a12,S2)))/dot(S0L1,S2);
    rE2 = rE1 + a12d*a12; 
end
    S3 = a12;
    S0L3 = cross(rE1,a12);
    l = [S3;S0L3];
end