function P = point_closest_to_origin_line(S,S0L)
%finds the point closest to origin from a line [S;SOL] 
%outputs the point closest to origin

%Ex. [,,;1,3,2] Sol=[]; S =[1;3;2]

P = cross(S,S0L)/dot(S,S);

end