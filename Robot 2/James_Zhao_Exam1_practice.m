clc;clear;
%% exam 2022
%given
S1 = [8,8,16];
P_A = [6,12,12];

P_B = [10,20,30];
P_sphere = [-8,-5,15];

S0L1 = cross(P_A,S1);
%%the line is defined as {S1;S0L1}

%%the plane is defined by a line (normal) and a point
[D0,S_plane] = plane_defined_by_line_and_point(S1,S0L1,P_B);

%%the sphere is tangent to the plane, so P_sphere's center's perpendicular
%%distance to the plane is the radius, the line that goes thorugh P_sphere
%%and is parallel to the S_plane (perpendicular to plane) will interesect the plane at tangent point

S2 = S_plane;  %same direction as the plane
S0L2 = cross(P_sphere,S_plane);

%%the line is defined now, we can calculate the intersection of the line
%%and plane ro


ro = point_of_intersection_line_and_plane(S2,S0L2,D0,S_plane);

%%distance is the magnitude of the differnce
d = norm(ro-P_sphere);
fprintf("Exam 2022\n")
fprintf("the radius of the sphere is %0.4f m\n\n",d)

%% exam 2021
fprintf("Exam 2021\n")
%given
P_light = [16,-8,14];
P_rod1 = [0,0,0];
P_rod2 = [0,-8,0];
P_camera = [40,-126,30];
P_1A = [29.5855, -110.25906, 29.76007];
P_1B = [31.34289, -109.16069,27.19173];
P_2A = [27.31188,-111.68008,31.34954];
P_2B = [30.12142,-109.92411,27.80503];

%%plane defined by the camera and line 1
SA = P_1B - P_1A;
S0LA = cross(P_1A,SA);
[D01,S_1] = plane_defined_by_line_and_point(SA,S0LA,P_camera);

%%plane defined by the camera and line 2
SB = P_2B - P_2A;
S0LB = cross(P_2A,SB);
[D02,S_2] = plane_defined_by_line_and_point(SB,S0LB,P_camera);

%%plane defined by the light sorce and the rod 1
S_vert = [0,0,1]; %two rods both have two verticle vectors [0,0,1]
S0LC = cross(P_rod1,S_vert);
[D03,S_3] = plane_defined_by_line_and_point(S_vert,S0LC,P_light);

%%plane defined by the light sorce and the rod 2
S0LD = cross(P_rod2,S_vert);
[D04,S_4] = plane_defined_by_line_and_point(S_vert,S0LD,P_light);

%%4 planes are defined, we can find the line of intesections
l2 = line_of_intersection_two_planes(D02,D04,S_2,S_4);
l1 = line_of_intersection_two_planes(D01,D03,S_1,S_3);

fprintf("two lines in Plucker coordinates are: \n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",l1(1,1),l1(1,2),l1(1,3),l1(2,1),l1(2,2),l1(2,3));
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",l2(1,1),l2(1,2),l2(1,3),l2(2,1),l2(2,2),l2(2,3))
%%after lines are found, we can find an arbituary point on l2 to define the plane
S_l1 = l1(1,:);
S0L_l1 =l1(2,:);

% r x S = S0L S =[1000.1975, 0.0000, -850.0296] S0L = [6800.2370, -13743.7151, 8001.5803], we can set x = 0
x = 0;
syms y z
eqs1 = -y*l2(1,1)-l2(2,3);
eqs2 = z*l2(1,1)-l2(2,2);
[y,z] = solve(eqs1==0,eqs2==0,y,z);
fprintf("point on the plane is (%0.4f, %0.4f, %0.4f)\n",x,y,z)

%the plane can be defined with the point and l1
r0 = [x,y,z];
[D0,S_plane1] = plane_defined_by_line_and_point(S_l1,S0L_l1,r0);
fprintf("the plane is : [%0.4f; %0.4f, %0.4f, %0.4f]\n",D0,S_plane1(1),S_plane1(2),S_plane1(3))

D0 = D0/norm(S_plane1);
S_plane1 = S_plane1/norm(S_plane1);
fprintf("unit vector normal is: [%0.4f; %0.4f, %0.4f, %0.4f]\n\n",D0,S_plane1(1),S_plane1(2),S_plane1(3))

%% exam 2020
fprintf("Exam 2020\n")

%given 
v1 = [-25.774,-55,-15];
A = [9,-4,4];
B = [6,7,7];

%%the point of interection of two lines

%%line defined by a direction and a point 
S_A = [-1,0,0]; 
S0L_A = cross(A,S_A);

S_B = v1;
S0L_B = cross(B,v1);

%%check if they intersect
[mm,~,~,~,~,~,~] = mutual_moment(S_A,S0L_A,S_B,S0L_B);

if mm == 0 %interset
  [w,r02]= point_of_intersection_two_lines(S_A,S0L_A,S_B,S0L_B);
end

fprintf("(a) The laser point strucks plane (%0.4f, %0.4f, %0.4f)\n",r02(1),r02(2),r02(3))

temp = transformationMatrix(120,[1,0,0],[0,0,0])*[0,1,0,1]';
S_plane2 = temp(1:3,1)';  %or just use trig
S0L_plane2 = [0,0,0];

[D05,S_5] = plane_defined_by_line_and_point(S_plane2,S0L_plane2,r02);

S_5 = unitVector(S_5)'; %unit vector

fprintf("(b) The nomal of the plane is [%0.4f, %0.4f, %0.4f]\n",S_5(1),S_5(2),S_5(3))








