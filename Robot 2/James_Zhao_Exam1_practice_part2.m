clc;clear;
%% exam 2013 (mirror)
%given
p_A = [4,3,-3];
p_B = [1,-1,2];
p_C = [2,2.5,0];
p_D = [10,6,2];
p_E = [5,2,6];

%%a plane is defined by A B and C, a line is defined by D and E 

%%part(a)
%%a plane is defined by a point (C) and and a line (AB)

% S1 = r2 - r1;
% S0L1 = cross(r1,S1);
S1 = p_B - p_A;
S0L1 = cross(p_A,S1);

[D0,S_plane] = plane_defined_by_line_and_point(S1,S0L1,p_C);

fprintf("(a) the plane is : [%0.4f; %0.4f, %0.4f, %0.4f]\n",D0,S_plane(1),S_plane(2),S_plane(3))

%%part(b)
%%a line is defiend by two points (DE)

S2 = p_E - p_D; %direction of the line
S0L2 = cross(p_D,S2);
S2_norm = norm(S2);

S2 = S2/S2_norm;
S0L2 = S0L2/S2_norm;

fprintf("the line in Plucker coordinates are: \n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S2(1),S2(2),S2(3),S0L2(1),S0L2(2),S0L2(3));



%%part(c) 
%%the mirrior problem!!(follow this procedure!!!)

%%determine the two lines DD' and EE' from projection
%%two lines should have the same direction as the normal of the mirroring plane 
S_D = S_plane;
S_E = S_plane;

S0LD = cross(p_D,S_D);
S0LE = cross(p_E,S_E);

%%the intersections of the lines and the planes D* and E* can be determined 
D_int = point_of_intersection_line_and_plane(S_D,S0LD,D0,S_plane); 
E_int = point_of_intersection_line_and_plane(S_E,S0LE,D0,S_plane);

%%point D' and E' can be found by D_int + (D_int-p_D) and E_int + (E_int-p_E)
D_line = D_int + (D_int-p_D);
E_line = E_int + (E_int-p_E);

%%the line can be determined by the two points
S_line = E_line - D_line;
S0L_line = cross(D_line,S_line);

%%unit vectorize
S_line_norm = norm(S_line);
S_line = S_line/S_line_norm;
S0L_line = S0L_line/S_line_norm;

fprintf("the MIRRORED line in Plucker coordinates are: \n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S_line(1),S_line(2),S_line(3),S0L_line(1),S0L_line(2),S0L_line(3));



