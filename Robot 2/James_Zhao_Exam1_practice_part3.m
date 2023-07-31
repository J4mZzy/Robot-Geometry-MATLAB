clc; clear;
%% exam 2019
%given
v1 = [2,1.25,1.5];
v2 = [3.5,-2.75,3];
u1 = [-3,1.25,1.5];
u2 = [-0.3,-0.55,0.6];
A = [0,0,0]; %v1 v2
B = [10,0,0]; %u1 u2 
t1 = 0;
t2 = 4;
fprintf("Exam 2019\n")

%%part(a)
%%the line can be determined from points P1 P2
%%the points are determined from lines of intersections v1 u1 and v2 u2
S1 = v1;
S0L1 = cross(A,S1);
S2 = v2;
S0L2 = cross(A,S2); 
S3 = u1;
S0L3 = cross(B,S3);
S4 = u2;
S0L4 = cross(B,S4);

[w1,p1] = point_of_intersection_two_lines(S1,S0L1,S3,S0L3); %v1 u1
[w2,p2] = point_of_intersection_two_lines(S2,S0L2,S4,S0L4); %v2 u2

%%line can be determined by two points
S_line = p2 - p1;
S0L_line = cross(p1,S_line);

%%unit vectorize
S_line_norm = norm(S_line);
S_line = S_line/S_line_norm;
S0L_line = S0L_line/S_line_norm;

fprintf("(a) the line in Plucker coordinates is: \n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S_line(1),S_line(2),S_line(3),S0L_line(1),S0L_line(2),S0L_line(3));


%%part(b)
%%t3 = 6, from p1 to p2 took 4 seconds, which means at 6 sec to traveled half
%%the distance it traveled
p3 = p2 + 1/2*S_line*norm(p2-p1);

fprintf("(b) the position is (%0.4f, %0.4f, %0.4f) unit(m) \n\n",p3(1),p3(2),p3(3))

%% exam 2018 
p_A = [180,0,4];
p_B = [-30,60,8];
S_B = [3,12,14.2969385];
S_sun = [1,1,-5];

fprintf("Exam 2018\n")
%%part(a)
%%the drone coorindates can be determined by finding the intersection of
%%lines

x_axis = [1;0;0;1]; %homogenous coordinates
temp = transformationMatrix(135,[0,0,1],[0,0,0])*transformationMatrix(-30,[0,1,0],[0,0,0])*x_axis;
Sline1 = temp(1:3)';
S0L_line1 = cross(p_A,Sline1);

Sline2 = S_B;
S0L_line2 = cross(p_B,Sline2);

[w3,p_drone] = point_of_intersection_two_lines(Sline1,S0L_line1,Sline2,S0L_line2);
fprintf("(a) the position of the drone is (%0.4f, %0.4f, %0.4f) unit(ft) \n",p_drone(1),p_drone(2),p_drone(3))

%%shadow point is the point of intersection of the sun ray(line) and the
%%field(plane)

Sline3 = S_sun;
S0L_line3 = cross(p_drone,Sline3);

D_field = 0; %pass through origin
S_field = [0,0,1];

r_shadow = point_of_intersection_line_and_plane(Sline3,S0L_line3,D_field,S_field);
fprintf("(b) the position of the shadow is (%0.4f, %0.4f, %0.4f) unit(ft) \n\n",r_shadow(1),r_shadow(2),r_shadow(3))

%% exam 2017
fprintf("Exam 2017\n")
D01 = 5;
D02 = -3;
S_plane1 = [1,-1,0];
S_plane2 = [2,1,1];

p4 = [5,2,2];

l = line_of_intersection_two_planes(D01,D02,S_plane1,S_plane2); %the line
p5 = point_on_a_line_closest_to_given_point(p4,l(1,:),l(2,:));
fprintf("the point is (%0.4f, %0.4f, %0.4f) unit(m) \n\n",p5(1),p5(2),p5(3))