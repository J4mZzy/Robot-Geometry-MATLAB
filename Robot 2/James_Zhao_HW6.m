clc; clear; %clear work space and command window
%% problem 1
w_0_1 = [2, 0.5, -1.5]'; %rad/sec
p_0_1 = [-1, 2, 0.5]'; %m
v_0_1_p = [10, 10, 0]'; %m/s

v_0_1_o = v_0_1_p-cross(w_0_1,p_0_1); % velocity of origin 
[~,~,wmag,S,S0L,h] = dyname_to_wrench(w_0_1,v_0_1_o); %wrench/screw parameters

fprintf("Problem 1:\n")
fprintf("(a) velocity of the point in body 1 that is at this instant coincident with the origin of the body 0 coordinate system is (m/s):\n") 
fprintf("    (%0.4f, %0.4f, %0.4f)\n",v_0_1_o(1),v_0_1_o(2),v_0_1_o(3))
fprintf("    the coordinates of the instantaneous twist is:\n")
fprintf("    %0.4f{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",wmag,S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))
fprintf(" = ")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",w_0_1(1),w_0_1(2),w_0_1(3),S0L(1)*wmag,S0L(2)*wmag,S0L(3)*wmag)

fprintf("(b) the pitch of the twist is: %0.4f m \n",h)

fprintf("(c) the Plücker coordinates of the line of action of the twist is: \n")
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))

P = point_closest_to_origin_line(S,S0L); %closest point to origin on the line 

fprintf("(d) the coordinates of the point on the line of action that is closest to the origin of the body 0 coordinate system is (m): \n")
fprintf("    (%0.4f, %0.4f, %0.4f)\n\n",P(1),P(2),P(3))


%% problem 2
clear
S1 = [1, 1, 1]';
S0L1 = [2, -1, -1]'; %m
S2 = [-1,2,4]';
S02 = [4,-4,10]'; %m (Screw)

%body 1 
w1mag = 2.5; %rad/sec (with respect to ground (body 0)) 0_w_1
v1mag = 4; %m/s
Sv1 = [2,1,1]';

%body 2
w2mag = 1.5; %rad/sec (with respect to body 1) 1_w_2

%unitize everything 
S1mag = norm(S1);
S1 = S1/S1mag;
S0L1 = S0L1/S1mag;
S2mag = norm(S2);
S2 = S2/S2mag;
S02 = S02/S2mag;

h = dot(S1,S0L1)/dot(S1,S1); %pitch equation (it happens to be a line!)
S01 = S0L1 + h*S1;

w_0_1 = w1mag*S1;
v_0_1_o = w1mag*S01+v1mag*Sv1/norm(Sv1);
w_1_2 = w2mag*S2;
v_1_2_o = w2mag*S02;

w_0_2 = w_0_1 + w_1_2;
v_0_2_o = v_0_1_o + v_1_2_o;

[~,~,wmag,S,S0L,h2] = dyname_to_wrench(w_0_2,v_0_2_o); %wrench/screw parameters

fprintf("Problem 2:\n")
fprintf("    the coordinates of the instantaneous twist is:\n")
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n\n",w_0_2(1),w_0_2(2),w_0_2(3),v_0_2_o(1),v_0_2_o(2),v_0_2_o(3))

%% problem 3
clear
v_0_6_tool = [2, 4, -7]'; %in/s
w_0_6 = [deg2rad(8), 0, 0]'; %rad/s

P_6_6_tool = [5, 3, 7, 1]'; %tool point
angles = [37,85,-23,71,127,101]; %angle list
S6_offset = 6; %5_S_6 offset
[P_0_6_tool,S6,a67,T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5] = forwardAnalysis("T3-776",P_6_6_tool,angles,S6_offset); %forward analysis for T3-776

% T_x_0,x=1,2,3...6, transformation matrices form x to fixed body
T_2_0 = T_1_0*T_2_1; %2 to 0
T_3_0 = T_1_0*T_2_1*T_3_2; %3 to 0
T_4_0 = T_1_0*T_2_1*T_3_2*T_4_3; %4 to 0 
T_5_0 = T_1_0*T_2_1*T_3_2*T_4_3*T_5_4; %5 to 0 
T_6_0 = T_1_0*T_2_1*T_3_2*T_4_3*T_5_4*T_6_5; %6 to 0

v_0_6_o = v_0_6_tool - cross(w_0_6,P_0_6_tool(1:3));

%the six joint axis vectors are defined as the first three elements of the third column of the T matrices
S1 = T_1_0(1:3,3);
S2 = T_2_0(1:3,3);
S3 = T_3_0(1:3,3);
S4 = T_4_0(1:3,3);
S5 = T_5_0(1:3,3);

% moment of the line along the ith joint axis
% A point on the ith joint axes can be obtained as the first three elements of the fourth column of the T matrix
S0L1 = cross(T_1_0(1:3,4),S1);
S0L2 = cross(T_2_0(1:3,4),S2);
S0L3 = cross(T_3_0(1:3,4),S3);
S0L4 = cross(T_4_0(1:3,4),S4);
S0L5 = cross(T_5_0(1:3,4),S5);
S0L6 = cross(T_6_0(1:3,4),S6);

%Jacobian 
J = [S1 S2 S3 S4 S5 S6;S0L1 S0L2 S0L3 S0L4 S0L5 S0L6];

%individual joint angluar velocities
w = J\[w_0_6;v_0_6_o];
fprintf("Problem 3:\n")
fprintf("    angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("    [%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f]\n",w(1),w(2),w(3),w(4),w(5),w(6))

