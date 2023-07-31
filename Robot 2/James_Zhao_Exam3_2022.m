clc; clear; %clear work space and command window
%% Exam 2022
h1 = 1/16/pi; %pitch 0 to 1
wmag1 = 1.5; %rad/sec
wmag2 = 0.75; %rad/sec
vmag3 = 1.25; %m/sec

S1 = [0,0,1]';
S0L1 = [0,0,0]'; %goes through origin
S01 = S0L1 + h1*S1; 
S2 = [0,1,0]';
S0L2 = [0,0,0]'; %goes through origin
S3 = [-cosd(40),0,sind(40)]';


w_0_1 = wmag1*S1;
v_0_1_o = wmag1*S01;

w_1_2 = wmag2*S2;
v_1_2_o = wmag2*S0L2;

w_2_3 = [0,0,0]'; %linear translation
v_2_3_o = vmag3*S3;

w_0_3 = w_0_1 + w_1_2 + w_2_3;
v_0_3_o = v_0_1_o + v_1_2_o + v_2_3_o;


fprintf("(a)velocity state parameters of body 3 relative to body 0 is:\n")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n\n",w_0_3(1),w_0_3(2),w_0_3(3),v_0_3_o(1),v_0_3_o(2),v_0_3_o(3))

% v_0_3_A = v_0_3_o + cross(w_0_3,P_0_3_A)

P_0_3_A = [-1.9*cosd(40)+1.5*cosd(50),-2.3,1.9*sind(40)+1.5*sind(50)]';
v_0_3_A = v_0_3_o + cross(w_0_3,P_0_3_A);
fprintf("(b)velocity of point A is:\n")
fprintf("[%0.4f, %0.4f, %0.4f] m/s\n",v_0_3_A(1),v_0_3_A(2),v_0_3_A(3))


