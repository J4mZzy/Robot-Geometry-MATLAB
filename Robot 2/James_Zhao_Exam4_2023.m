%% Exam 2023
clc;clear;

%% Problem 1
fprintf("Problem 1:\n")
fprintf("(See PDF)\n\n")

%% Problem 2
%RCPC robot
%C becomes RP
%RRPPRP robot
P_4_4_tool = [2, 0, 0, 1]'; %tool point

angles = [50,110,270,270]; %phi and thetas
alphas = [90,330,225]; %alphas
S1 = 4;
S2 = 2.5;
S3 = 3;

%forward analysis
T_1_0 = transformationMatrix(angles(1),[0,0,1],[0,0,0]); %1 to F
T_2_1 = transformationMatrixForward(angles(2),alphas(1),5,S1); %2 to 1
T_3_2 = transformationMatrixForward(angles(3),alphas(2),3.75,S2); %3 to 2
T_4_3 = transformationMatrixForward(angles(4),alphas(3),3.75,S3); %4 to 3

% T_x_0,x=1,2,3...6, transformation matrices form x to fixed body
T_2_0 = T_1_0*T_2_1; %2 to 0
T_3_0 = T_1_0*T_2_1*T_3_2; %3 to 0
T_4_0 = T_1_0*T_2_1*T_3_2*T_4_3; %4 to 0 

%the six joint axis vectors are defined as the first three elements of the third column of the T matrices
S1 = T_1_0(1:3,3);
S2 = T_2_0(1:3,3);
S3 = T_3_0(1:3,3);
S4 = T_4_0(1:3,3);

%disred velocity of tool point (A) [w;v]
v_0_4_tool = [0, 5.0, 7.5]'; %in/s
w_0_4 = [0, -0.2, 0]'; %rad/s

P_0_4_tool = T_4_0*P_4_4_tool;
v_0_4_o = v_0_4_tool - cross(w_0_4,P_0_4_tool(1:3));
desired = [w_0_4;v_0_4_o];

% moment of the line along the ith joint axis
% A point on the ith joint axes can be obtained as the first three elements of the fourth column of the T matrix
S0L1 = cross(T_1_0(1:3,4),S1);
S0L2 = cross(T_2_0(1:3,4),S2);
S0L3 = cross(T_3_0(1:3,4),S3);
S0L4 = cross(T_4_0(1:3,4),S4);


temp = [0,0,0]'; %used for constructing the prismatic Jacobian elements

%Jacobian 
J = [S1 S2 temp temp S4 temp;S0L1 S0L2 S2 S3 S0L4 S4];
%individual joint angluar velocities
w = J\desired;

%w(1) is w_0_1, w(2) is w_1_2, w(3) is v_1_2, w(4) is v_2_3, w(5) is
%w_3_4, w(6) is v_3_4 (RCPC to RRPPRP)

% relative velocity state parameters

%first joint(R)
w_0_1 = w(1)*S1;
v_0_1 = w(1)*S0L1; %R

%C to RP (second joint)
w_1_2_R = w(2)*S2;
v_1_2_R = w(2)*S0L2; %R
w_1_2_P = w(3)*temp;
v_1_2_P = w(3)*S2; %P

%third joint(P)
w_2_3_P = w(4)*temp;
v_2_3_P = w(4)*S3; %P

%C to RP (fourth joint)
w_3_4_R = w(5)*S4; 
v_3_4_R = w(5)*S0L4; %R
w_3_4_P = w(6)*temp;
v_3_4_P = w(6)*S4; %P

%desired acceleration state
alpha_0_4 =  [0.1, -0.15, 0]'; %angular accel
a_0_4_A = [0.15, 1.2, 0.5]'; %linear accel of A
a_0_4_o = a_0_4_A - cross(alpha_0_4,P_0_4_tool(1:3))-cross(w_0_4,cross(w_0_4,P_0_4_tool(1:3))); %linear accel of origin

%reduced accelerations
alpha_0_4_R = alpha_0_4 - cross(w_0_1,w_1_2_R+w_1_2_P+w_2_3_P+w_3_4_R+w_3_4_P)-...
cross(w_1_2_R,w_1_2_P+w_2_3_P+w_3_4_R+w_3_4_P)-...
cross(w_1_2_P,w_2_3_P+w_3_4_R+w_3_4_P)-...
cross(w_2_3_P,w_3_4_R+w_3_4_P)-...
cross(w_3_4_R,w_3_4_P);

a_0_4_R =  a_0_4_o-cross(w_0_1,v_0_1)-cross(w_1_2_R,v_1_2_R)-cross(w_1_2_P,v_1_2_P)-...
-cross(w_2_3_P,v_2_3_P)-cross(w_3_4_R,v_3_4_R)-cross(w_3_4_P,v_3_4_P)-...
2*cross(w_0_1,v_1_2_R+v_1_2_P+v_2_3_P+v_3_4_R+v_3_4_P)-...
2*cross(w_1_2_R,v_1_2_P+v_2_3_P+v_3_4_R+v_3_4_P)-...
2*cross(w_1_2_P,v_2_3_P+v_3_4_R+v_3_4_P)-...
2*cross(w_2_3_P,v_3_4_R+v_3_4_P)-...
2*cross(w_3_4_R,v_3_4_P);

%individual joint angluar accelerations
accel_state_0_4_R = [alpha_0_4_R;a_0_4_R];
a = J\accel_state_0_4_R;

fprintf("Problem 2:\n")
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s^2 rad/s^2 in/s^2 in/s^2 rad/s^2 in/s^2)\n",a(1),a(2),a(3),a(4),a(5),a(6))







