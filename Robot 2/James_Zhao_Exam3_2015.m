clc; clear; %clear work space and command window
%% Exam 2015
%closed-loop RRRPRRR robot 
w_0_1 = 0.25;
P_H1 = [1.6617,-1.6617,0]';
P_H2 = [2.1888,-2.1888,1.6932]';
P_B = [1.4594,-1.4594,2.1421]';
P_A = [2.35,3.5,-1.65]';

%joints
S1 = [0,0,1]';
S0L1 = [0,0,0]'; %goes through the origin
S2 = [cosd(45),sind(45),0]';
S0L2 = cross(P_H1,S2);
S3 = S2;
S0L3 = cross(P_H2,S3);
S4 = -S3;

S_bs1 = [1,0,0]'; % ball-and-socket (3DOF)
S0L_bs1 = cross(P_A,S_bs1); %centered at A
S_bs2 = [0,1,0]';
S0L_bs2 = cross(P_A,S_bs2);
S_bs3 = [0,0,1]';
S0L_bs3 = cross(P_A,S_bs3);

%Jacobian (without the knowns)
J = [S2 S3 [0,0,0]' S_bs1 S_bs2 S_bs3;S0L2 S0L3 S4 S0L_bs1 S0L_bs2 S0L_bs3];

%individual joint angluar/linear velocities
w = J\(-w_0_1*[S1;S0L1]); %RHS is the known (negated)
fprintf("(a)angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s rad/s rad/s in/s rad/s rad/s)\n",w(1),w(2),w(3),w(4),w(5),w(6))
fprintf("linear velocity for prismatic joint v_3_4 is:\n")
fprintf("%0.4f\n\n",w(3))

%Velocity of point B (on body 3)
velocitystate_3 = [w_0_1*S1+w(1)*S2+w(2)*S3;w_0_1*S0L1+w(1)*S0L2+w(2)*S0L3]; %J(:,1:3)*[ w(1:2])
v_check = [[S1;S0L1] J(:,1:2)]*[w_0_1;w(1:2)];

%[w_0_3 v_0_3]
% v_0_3_A = v_0_3_o + cross(w_0_3,P_0_3_A)

P_0_3_B = P_B; %Point B
w_0_3 = velocitystate_3(1:3);
v_0_3_o = velocitystate_3(4:6);

v_0_3_B = v_0_3_o + cross(w_0_3,P_0_3_B);
fprintf("(b)velocity of point B is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] m/s\n",v_0_3_B(1),v_0_3_B(2),v_0_3_B(3))

% relative velocity state parameters

%first joint
w_0_1 = w_0_1*S1;
v_0_1 = w_0_1*S0L1; %R

%second joint
w_1_2 = w(1)*S2;
v_1_2 = w(1)*S0L2; 

%third joint
w_2_3 = w(2)*S3;
v_2_3 = w(2)*S0L3; %P

%fourth joint
w_3_4 = w(3)*temp;
v_3_4 = w(3)*S4; %P

%C to RP (fourth joint)
w_4_0_x = w(4)*S_bs1; 
v_4_0_x = w(4)*S0L_bs1; %R
w_4_0_y = w(5)*S_bs2; 
v_4_0_y = w(5)*S0L_bs2; %R
w_4_0_z = w(6)*S_bs3; 
v_4_0_z = w(6)*S0L_bs3; %R







