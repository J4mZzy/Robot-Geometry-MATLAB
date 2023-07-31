clc; clear; %clear work space and command window
%% Exam 2017
%RRRRPRRR robot
%ball-and-socket becomes RRR

P_A = [73.23,-84.85,-84.85]';
P_B = [595,0,160]';
P_C = [132.79,-47.81,-148.99]';
P_D = [132.79,-153.64,-112.31]';
P_E = [586.27,-79.92,100.40]';

%known velocities
w_0_1 = 30; %S1
w_0_5 = 25; %S6 (0 to 5)

%joints 
S1 = [1,0,0]';
S0L1 = [0,0,0]';

S_bs1 = [1,0,0]'; % ball-and-socket (3DOF)
S0L_bs1 = cross(P_A,S_bs1); %centered at A
S_bs2 = [0,1,0]';
S0L_bs2 = cross(P_A,S_bs2);
S_bs3 = [0,0,1]';
S0L_bs3 = cross(P_A,S_bs3);

S3 = unitVector(P_E-P_D); %prismatic

S4 = unitVector(P_D-P_C);
S0L4 = cross(P_B,S4); 
S5 = [1,0,0]';
S0L5 = cross(P_B,S5); 
S6 = [1,0,0]';
S0L6 = [0,0,0]'; %close loop,S6 goes through origin


%Jacobian (without the knowns)
J = [S_bs1 S_bs2 S_bs3 [0,0,0]' S4 S5; S0L_bs1 S0L_bs2 S0L_bs3 S3 S0L4 S0L5];

%individual joint angluar/linear velocities
w = J\(-deg2rad(w_0_1)*[S1;S0L1]-deg2rad(w_0_5)*[S6;S0L6]); %RHS is the known (negated)
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s rad/s rad/s in/s rad/s rad/s)\n",w(1),w(2),w(3),w(4),w(5),w(6))
fprintf("linear velocity for prismatic joint v_2_3 is:\n")
fprintf("%0.4f\n\n",w(4))

%check
check = J*w;
desired = -deg2rad(w_0_1)*[S1;S0L1]-deg2rad(w_0_5)*[S6;S0L6]; 
for i = 1:length(check)
    diff(i) = check(i)-desired(i);
end
if max(diff) <10^-6
    fprintf("answer is right!\n")
else
    fprintf("answer is wrong!\n")
end

