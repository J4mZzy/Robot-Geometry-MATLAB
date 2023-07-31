clc; clear; %clear work space and command window
%% Exam 2012
%PRPRR
v_0_1 = 5;
w_1_2 = -2;

%Joints
S1 = [cosd(30), sind(30), 0]'; %prismatic

S2 = [0,0,1]';
S0L2 = [0,0,0]'; %goes thorugh origin

S3 = [-sin(atan(5/(3+5))),cos(atan(5/(3+5))),0]'; %prismtic
S4 = [0,0,1]';
S0L4 = cross([-5,8,0]',S4);
S5 = [0,0,1]';
S0L5 = cross([-5,5,0]',S5);

%Jacobian (without the knowns)
J = [[0,0,0]' S4 S5;S3 S0L4 S0L5];

%individual joint angluar/linear velocities
w = J\(-v_0_1*[[0,0,0]';S1]-w_1_2*[S2;S0L2]); %RHS is the known (negated)
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f] (in/s rad/s rad/s)\n",w(1),w(2),w(3))

%find v_0_3_C
P_C = [-5,8,0]';
velocitystate3 = [[0;0;0;S1] [S2;S0L2] [0;0;0;S3]]*[v_0_1;w_1_2;w(1)];
w_0_3 = velocitystate3(1:3);
v_0_3_o = velocitystate3(4:6);
v_0_3_C = v_0_3_o + cross(w_0_3,P_C);

%find v_D
P_D = 11*S3;
velocitystate2 = [[0;0;0;S1] [S2;S0L2]]*[v_0_1;w_1_2];
w_0_2 = velocitystate2(1:3);
v_0_2_o = velocitystate2(4:6);
v_0_2_D = v_0_2_o + cross(w_0_2,P_D);

fprintf("\n(a)the linear velocity of point C in body 3 is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] in/s\n\n",v_0_3_C(1),v_0_3_C(2),v_0_3_C(3))
fprintf("(b)the linear velocity of point D in body 2 is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] in/s\n\n",v_0_2_D(1),v_0_2_D(2),v_0_2_D(3))



