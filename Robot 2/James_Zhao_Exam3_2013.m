clc; clear; %clear work space and command window
%% Exam 2013

%% Problem 1 
P_A = [1.414,1.414,0]';
P_B = [2.380,1.673,0]';
P_C = [3.476,0,0]';
P_D = [4.018,2.820,0]';
P_E = [6.0,0,0]';
P_F = [3.132,4.096,0]';
P_G = [5.0,4.812,0]';


%plannar robot IMPORTANT!!!!
S_0_1 = [0,0,1]';
S0L_0_1 = [0,0,0]'; %goes through origin
S_1_2 = [0,0,1]';
S0L_1_2 = cross(P_A,S_1_2);
S_2_3 = [0,0,1]';
S0L_2_3 = cross(P_C,S_2_3);
S_3_0 = [1,0,0]'; %prismatic

S_2_4 = [0,0,1]';
S0L_2_4 = cross(P_B,S_2_4) ;
S_4_5 = unitVector(P_F-P_E); %prismatic
S_5_0 = S_0_1;
S0L_5_0 = cross(P_E,S_5_0);

S_5_6 = [0,0,1]';
S0L_5_6 = cross(P_F,S_5_6);
S_6_7 = [0,0,1]';
S0L_6_7 = cross(P_G,S_6_7);
S_7_0 = [0,1,0]'; %prismatic

w_0_1 = 0.75;
%3 closed loop mechanisms

%1. OAC
%Jacobian (without the knowns)
J1 = [S_1_2 S_2_3 [0,0,0]'; S0L_1_2 S0L_2_3 S_3_0];
%individual joint angluar/linear velocities
w1 = J1\(-w_0_1*[S_0_1;S0L_0_1]); %RHS is the known (negated)

v_0_3_C = -w1(3);
v_0_3_C_vec = v_0_3_C*S_3_0; %here keep the original vec direction

%2. CBDE
S_0_3 = -S_3_0; %flip direction IMPORTANT while doing multiple close loops

S_3_2 = -S_2_3;  %flip direction
S0L_3_2 = -S0L_2_3;

%Jacobian (without the knowns)
J2 = [S_2_4 [0,0,0]' S_5_0;S0L_2_4 S_4_5 S0L_5_0];
%individual joint angluar/linear velocities
w2 = J2\(-w1(2)*[S_3_2;S0L_3_2]-w1(3)*[0;0;0;S_0_3]); %RHS is the known (negated)

v_5_4_D = -w2(2);
v_5_4_D_vec = v_5_4_D*S_4_5;

%3. EDFG
S_0_5 = -S_5_0;  %flip direction
S0L_0_5 = -S0L_5_0;

%Jacobian (without the knowns)
J3 = [S_5_6 S_6_7 [0,0,0]';S0L_5_6 S0L_6_7 S_7_0];
%individual joint angluar/linear velocities
w3 = J3\(-w2(3)*[S_0_5;S0L_0_5]); %RHS is the known (negated)

v_0_7_G = -w3(3);
v_0_7_G_vec = v_0_7_G*S_7_0; %here keep the original vec direction

fprintf("Problem1: linear velocity for prismatic joint v_0_3 is:\n")
fprintf("[%0.4f,%0.4f,%0.4f], magnitude/speed: %0.4f\n",v_0_3_C_vec(1),v_0_3_C_vec(2),v_0_3_C_vec(3),v_0_3_C)
fprintf("linear velocity for prismatic joint v_5_4 is:\n")
fprintf("[%0.4f,%0.4f,%0.4f], magnitude/speed: %0.4f\n",v_5_4_D_vec(1),v_5_4_D_vec(2),v_5_4_D_vec(3),v_5_4_D)
fprintf("linear velocity for prismatic joint v_0_7 is:\n")
fprintf("[%0.4f,%0.4f,%0.4f], magnitude/speed: %0.4f\n\n",v_0_7_G_vec(1),v_0_7_G_vec(2),v_0_7_G_vec(3),v_0_7_G)



%% Problem 2 
%RRRRP robot
clear
w_0_1 = 10*2*pi/60; %rad/s
w_1_2 = 15*w_0_1;

%joints
%first locate point A and C
P_A = [-15,cosd(45),-sind(45)]';
alpha = asin(1/sqrt(2)/15);
P_C = P_A+[0,-15*sin(alpha),-15*cos(alpha)]';

S1 = [0,0,1]';
S0L1 = [0,0,0]'; %goes through origin 
S2 = [1,0,0]';
S0L2 = [0,0,0]'; %goes through origin
S3 = [1,0,0]';
S0L3 = cross(P_A,S3);
S4 = [1,0,0]';
S0L4 = cross(P_C,S4);
S5 = [0,0,1]'; %prismatic

%Jacobian (without the knowns)
J = [S3 S4 [0,0,0]'; S0L3 S0L4 S5];

%individual joint angluar/linear velocities
w = J\(-w_0_1*[S1;S0L1]-w_1_2*[S2;S0L2]); %RHS is the known (negated)
fprintf("Problem2: angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f] (rad/s rad/s ft/s)\n",w(1),w(2),w(3))

%find v_0_3_C
%find velocity state [w_0_3;v_0_3] = J*w

velocitystate = [[S1;S0L1] [S2;S0L2] J(:,1)]*[w_0_1;w_1_2;w(1)];
w_0_3 = velocitystate(1:3);
v_0_3_o = velocitystate(4:6);
fprintf("velocity state of body 3 relative to body 0 is:\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] \n",w_0_3(1),w_0_3(2),w_0_3(3),v_0_3_o(1),v_0_3_o(2),v_0_3_o(3))

P_0_3_C = P_C;
v_0_3_C = v_0_3_o + cross(w_0_3,P_0_3_C);
fprintf("velocity of point B is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] ft/s\n",v_0_3_C(1),v_0_3_C(2),v_0_3_C(3))












