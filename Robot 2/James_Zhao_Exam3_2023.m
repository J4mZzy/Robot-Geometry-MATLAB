clc; clear; %clear work space and command window
%% Exam 2023
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
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s rad/s in/s in/s rad/s in/s)\n",w(1),w(2),w(3),w(4),w(5),w(6))

