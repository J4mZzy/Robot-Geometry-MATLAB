function p2 = point_on_a_line_closest_to_given_point(p1,S,S0L)
%finds the point p2 on a line {S;S0L} closest to a given point p1 
%outputs the point 

%Ex. [,,;1,3,2] Sol=[]; S =[1;3;2]

p2 = p1 + cross(S,(S0L-cross(p1,S)))/dot(S,S);

end