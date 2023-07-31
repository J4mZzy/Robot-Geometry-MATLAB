clc; clear; %clear work space and command window
%% Exam 2018
%RRRRRR robot

P_A = [4.5962,4.5962,7.6250]';
P_B = [10.1267,1.6414,11.7380]';
P_C = [13.7886,3.1820,7]';
P_D = [10.6066,0,0]';

%desired velocity state
desired = 3.5*[0,0,0,1,0,0]'; %[w_0_6;v_0_6_o]; desired velocity state

%the lines/screws 
S1 = [0,0,1]';
S0L1 = [0,0,0]'; %goes through origin 
S2 = [cosd(45),-sind(45),0]';
S0L2 = cross(P_A,S2);
S3 = S2;
S0L3 = cross(P_B,S3);
S4 = S2;
S0L4 = cross(P_C,S4);
S5 = [0,0,-1]';
S0L5 = cross(P_D,S5);
S6 = [1,0,0]';
S0L6 = [0,0,0]'; %close loop, goes thorugh origin

%Jacobian
J = [S1 S2 S3 S4 S5 S6;S0L1 S0L2 S0L3 S0L4 S0L5 S0L6];

%individual joint angluar velocities
w = J\desired;
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s rad/s rad/s rad/s rad/s rad/s)\n",w(1),w(2),w(3),w(4),w(5),w(6))
fprintf("angular velocity for first joint w_0_1 is:\n")
fprintf("%0.4f\n\n",w(1))

%check
check = J*w;
for i = 1:length(check)
    diff(i) = check(i)-desired(i);
end
if max(diff) <10^-6
    fprintf("answer is right!\n")
else
    fprintf("answer is wrong!\n")
end