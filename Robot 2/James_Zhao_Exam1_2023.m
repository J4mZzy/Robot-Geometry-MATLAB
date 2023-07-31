clc;clear;
%given
p_A = [13,4,-4]; %on l1
S1 = [-5,1,-2]; 
S1 = S1/norm(S1);
p_B = [0,0,-16]; %on the mirror
S_mirror = [sind(25) 0 cosd(25)]; 
%wall plane is defined
D0_w = 12;
S_wall = [1,0,0];

%find the line l1
S0L1 = cross(p_A,S1); %l1 is defined

%find plane 
D0_mirror = -dot(p_B,S_mirror); %mirror plane is defined


p_mirror = point_of_intersection_line_and_plane(S1,S0L1,D0_mirror,S_mirror);
fprintf("the point C on mirror is (%0.4f, %0.4f, %0.4f) unit(m)\n",p_mirror(1),p_mirror(2),p_mirror(3))

S1_new = [-5;1;-2;1]; %homogenous (w at the end)

temp = transformationMatrix(180,S_mirror,[0,0,0])*S1_new; %rotate 180 degrees around S_mirror axis
S2 = temp (1:3)';
S0L2 = cross(p_mirror,S2); %l2 is defined

p_D = point_of_intersection_line_and_plane(S2,S0L2,D0_w,S_wall);
fprintf("the point D on the wall is (%0.4f, %0.4f, %0.4f) unit(m)\n",p_D(1),p_D(2),p_D(3))
