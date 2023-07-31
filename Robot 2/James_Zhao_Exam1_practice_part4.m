clc;clear;
%% exam 2015 (another mirror)
fprintf("Exam 2015\n")
%given
p_laser = [220,340,115];
temp = transformationMatrix(90,[1,0,0],[0,0,0])*transformationMatrix(20,[0,1,0],[0,0,0])*transformationMatrix(10,[1,0,0],[0,0,0])*[0,0,1,1]';
S1 = temp(1:3)';
S0L1 = cross(p_laser,S1);
D_mirror = 0;
S_mirror = [0,1,0];
p_mirror = point_of_intersection_line_and_plane(S1,S0L1,D_mirror,S_mirror);
fprintf("(a) the laser point on mirror is (%0.4f, %0.4f, %0.4f) unit(in)\n",p_mirror(1),p_mirror(2),p_mirror(3))

S2 = [0,0,1];
S0L2 = [0,0,0]; 
[mm, a12_1, alpha12_1, a12d_1, a12_2, alpha12_2, a12d_2] = mutual_moment(S1,S0L1,S2,S0L2);
if mm ~= 0
    [l,rE1,rE2] = perpendicular_line_to_two_lines(S1,S0L1,S2,S0L2); %rE1 on S1
end
fprintf("(b) the point on Z_F is (%0.4f, %0.4f, %0.4f) unit(in) \n",rE1(1),rE1(2),rE1(3))
fprintf("(b) the point on laser beam is (%0.4f, %0.4f, %0.4f) unit(in) \n\n",rE2(1),rE2(2),rE2(3))

%% exam 2014 
fprintf("Exam 2014\n")
%given
p_A = [3,8,-2];
p_B = [8,-4,6];
S_1 = [0.2,0.4,1.2];
S_2 = [-0.3,1.6,0.4];
D0 = 6;
S_plane = [3.2,1.8,10.1];

S0L_1 = cross(p_A,S_1);
S0L_2 = cross(p_B,S_2);
%%point C
[w_C,p_C] = point_of_intersection_two_lines(S_1,S0L_1,S_2,S0L_2);

%%line that is perpendicular to the plane that goes through C
S_3 = S_plane;
S0L_3 = cross(p_C,S_3);

%%intersection of the line and plane
r_closest_to_C = point_of_intersection_line_and_plane(S_3,S0L_3,D0,S_plane); 
fprintf("the point closest to C on  is (%0.4f, %0.4f, %0.4f) unit(in) \n",r_closest_to_C(1),r_closest_to_C(2),r_closest_to_C(3))











