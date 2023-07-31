clc; clear; %clear work space and command window
%% Exam 2019
%two planar robot manipulators 
p = [7.56,6.49,0]';

%desired velocity state of workpeice
wmag_0_wp = 1.4;
Sp = [0,0,1]'; %z-axis
S0Lp = cross(p,Sp);
w_0_p = wmag_0_wp*Sp;
v_0_p_o = wmag_0_wp*S0Lp;

desired = [w_0_p;v_0_p_o];
%LHS
%find line 1A 2A and 3A
S1A = [0,0,1]';
S0L1A = [0,0,0]'; %goes through origin

S2A = [0,0,1]';
S0L2A = cross(4*[cosd(70),sind(70),0]',S2A);

S3A = [0,0,1]';
S0L3A = cross([4*cosd(70)+3*cosd(70-25),4*sind(70)+3*sind(70-25),0]',S3A);

%RHS
%find line 1B 2B and 3B
S1B = [0,0,1]';
S0L1B = cross([14,2,0]',S1B); %origin is picked on the left robot

S0L2B = [0,1,0]'; %prismatic, sliding up and down 

S3B = [0,0,1]';
S0L3B = cross([14-2.75,2+2.66,0]',S3B);

%Jacobian for robot 1
J1 = [S1A S2A S3A;S0L1A S0L2A S0L3A];

%individual joint angluar velocities
w1 = J1\desired;

%Jacobian for robot 2
J2 = [S1B [0,0,0]' S3B;S0L1B S0L2B S0L3B];

%individual joint angluar velocities
w2 = J2\desired;

fprintf("angular velocities for each of the joints in order for robot A are (1-3):\n")
fprintf("[%0.4f, %0.4f, %0.4f] (rad/s rad/s rad/s)\n",w1(1),w1(2),w1(3))
fprintf("angular velocities/linear velocity for each of the joints in order for robot B are (1-3):\n")
fprintf("[%0.4f, %0.4f, %0.4f] (rad/s in/s rad/s)\n\n",w2(1),w2(2),w2(3))

%check
check = J1*w1;
for i = 1:length(check)
    diff(i) = check(i)-desired(i);
end
if max(diff) <10^-6
    fprintf("answer is right!\n")
else
    fprintf("answer is wrong!\n")
end



