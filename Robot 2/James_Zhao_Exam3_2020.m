clc; clear; %clear work space and command window
%% Exam 2020
%RRPRRR robot

S6_offset = 0.5;
angles = [135,270,0,225,300,90];

T_1_0 = transformationMatrix(angles(1),[0,0,1],[0,0,0]); %1 to F
T_2_1 = transformationMatrixForward(angles(2),0,2,0.5); %2 to 1
T_3_2 = transformationMatrixForward(angles(3),270,2,2); %3 to 2
T_4_3 = transformationMatrixForward(angles(4),0,2,0.5); %4 to 3
T_5_4 = transformationMatrixForward(angles(5),270,2,0.5); %5 to 4
T_6_5 = transformationMatrixForward(angles(6),0,2,S6_offset); %6 to 5

% T_x_0,x=1,2,3...6, transformation matrices form x to fixed body
T_2_0 = T_1_0*T_2_1; %2 to 0
T_3_0 = T_1_0*T_2_1*T_3_2; %3 to 0
T_4_0 = T_1_0*T_2_1*T_3_2*T_4_3; %4 to 0 
T_5_0 = T_1_0*T_2_1*T_3_2*T_4_3*T_5_4; %5 to 0 
T_6_0 = T_1_0*T_2_1*T_3_2*T_4_3*T_5_4*T_6_5; %6 to 0

%the six joint axis vectors are defined as the first three elements of the third column of the T matrices
S1 = T_1_0(1:3,3);
S2 = T_2_0(1:3,3);
S3 = T_3_0(1:3,3);
S4 = T_4_0(1:3,3);
S5 = T_5_0(1:3,3);
S6 = T_6_0(1:3,3);

% moment of the line along the ith joint axis
% A point on the ith joint axes can be obtained as the first three elements of the fourth column of the T matrix
S0L1 = cross(T_1_0(1:3,4),S1);
S0L2 = cross(T_2_0(1:3,4),S2);
S0L3 = cross(T_3_0(1:3,4),S3);
S0L4 = cross(T_4_0(1:3,4),S4);
S0L5 = cross(T_5_0(1:3,4),S5);
S0L6 = cross(T_6_0(1:3,4),S6);

temp = [0,0,0]'; %used for constructing the prismatic Jacobian elements

%Jacobian 
J = [S1 S2 temp S4 S5 S6;S0L1 S0L2 S3 S0L4 S0L5 S0L6];

%desired velocity
desired = 0.75*[0,0,0,0,0,1]'; %[w_0_6;v_0_6_o]; desireed velocity state

%individual joint angluar velocities
w = J\desired;
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6,in/s):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s rad/s m/s rad/s rad/s rad/s)\n",w(1),w(2),w(3),w(4),w(5),w(6))

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

% relative velocity state parameters

%first joint
w_0_1 = w(1)*S1;
v_0_1 = w(2)*S0L1; %R

%second joint
w_1_2 = w(2)*S2;
v_1_2 = w(2)*S0L2; 

%third joint
w_2_3 = w(3)*temp;
v_2_3 = w(3)*S3; %P

%fourth joint
w_3_4 = w(4)*S4;
v_3_4 = w(4)*S0L4; %R

%fifth joint
w_4_5 = w(5)*S5; 
v_4_5 = w(5)*S0L5; %R

%sixth joint
w_5_6 = w(6)*S6; 
v_5_6 = w(6)*S0L6; %R

%desired acceleration state
alpha_0_6 =  [0.1, 0.2, -0.1]'; %angular accel
a_0_6_o = [0.2, 0.1, 0]'; %linear accel of origin

%reduced accelerations
alpha_0_6_R = alpha_0_6 - cross(w_0_1,w_1_2+w_2_3+w_3_4+w_4_5+w_5_6)-...
cross(w_1_2,w_2_3+w_3_4+w_4_5+w_5_6)-cross(w_2_3,w_3_4+w_4_5+w_5_6)-...
cross(w_3_4,w_4_5+w_5_6)-cross(w_4_5,w_5_6);

a_0_6_R =  a_0_6_o-cross(w_0_1,v_0_1)-cross(w_1_2,v_1_2)-cross(w_2_3,v_2_3)-cross(w_3_4,v_3_4)-cross(w_4_5,v_4_5)-...
cross(w_5_6,v_5_6)-2*cross(w_0_1,v_1_2+v_2_3+v_3_4+v_4_5+v_5_6)-...
2*cross(w_1_2,v_2_3+v_3_4+v_4_5+v_5_6)-2*cross(w_2_3,v_3_4+v_4_5+v_5_6)-...
2*cross(w_3_4,v_4_5+v_5_6)-2*cross(w_4_5,v_5_6);

%individual joint angluar accelerations
accel_state_0_6_R = [alpha_0_6_R;a_0_6_R];
a = J\accel_state_0_6_R;
fprintf("angular velocities for each of the joints in order that the end effector moves as desired at this instant are (1-6):\n")
fprintf("[%0.4f, %0.4f, %0.4f, %0.4f, %0.4f, %0.4f] (rad/s^2 rad/s^2 in/s^2 in/s^2 rad/s^2 in/s^2)\n",a(1),a(2),a(3),a(4),a(5),a(6))
