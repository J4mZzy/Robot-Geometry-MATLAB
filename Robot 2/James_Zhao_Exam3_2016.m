clc; clear; %clear work space and command window
%% Exam 2016
w_0_1 = -10;
w_1_2 = 5;
v_2_3_b = 20; %bead moves DOWN the spoke
%joints 
S1 = [0,0,1]';
S0L1 = [0,0,0]';
S2 = [1,0,0]';
S0L2 = cross([0,5,0]',S2);
S3 = [0,cosd(60),sind(60)]'; %prismatic

%velocity state
w_0_3 = w_0_1*S1 + w_1_2*S2;
v_0_3_o = w_0_1*S0L1 + w_1_2*S0L2 - v_2_3_b*S3; % -v_2_3 for moving down
fprintf("(a)velocity state parameters of body 3 relative to body 0 is:\n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n\n",w_0_3(1),w_0_3(2),w_0_3(3),v_0_3_o(1),v_0_3_o(2),v_0_3_o(3))

% v_0_3_b = v_0_3_o + cross(w_0_3,P_0_3_b)
P_0_3_b = [0,5+cosd(60),sind(60)]';
v_0_3_b = v_0_3_o + cross(w_0_3,P_0_3_b);
fprintf("(b)velocity of the bead to ground is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] m/s\n",v_0_3_b(1),v_0_3_b(2),v_0_3_b(3))

