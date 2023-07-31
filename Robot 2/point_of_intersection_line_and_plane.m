function ro = point_of_intersection_line_and_plane(S1,S0L1,D02,S2)
%finds the point of intersection from a line and a plane 
%inputs are the line [S1;S0L1] and the plane [D02;S2]

ro = (cross(S2,S0L1)-D02*S1)/dot(S1,S2);
end