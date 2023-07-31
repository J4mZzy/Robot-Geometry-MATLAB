function P = point_closest_to_origin_plane(D0,S)
%finds the point closest to origin from a plane [D0;S] 
%outputs the point closest to origin

%Ex. [12.2;1,3,2] D0 = 12; S =[1;3;2]

P = -D0*S/dot(S,S);
end