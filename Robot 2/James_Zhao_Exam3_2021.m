clc; clear; %clear work space and command window
%% Exam 2021
%RCCC robot close loop
a0 = 0;
a1 = 1;
a2 = 1;
a3 = 1;

alpha0 = 150;
alpha1 = 300;
alpha2 = 90;
alpha3 = 135;

S0 = 0.8;
S1 = 0.7767;
S2 = 2.7029;
S3 = 3.1039;

theta0 = 30;
theta1 = 300.594;
theta2 = 274.706;
theta3 = 299.037;

w_0_1 = deg2rad(30);

%forward analysis
T_1_0 = transformationMatrixForward(theta0,alpha0,a0,S0); %the first link is not vertical to the ground 
T_2_1 = transformationMatrixForward(theta1,alpha1,a1,S1);
T_3_2 = transformationMatrixForward(theta2,alpha2,a2,S2);
T_0_3 = transformationMatrixForward(theta3,alpha3,a3,S3);

T_2_0 = T_1_0*T_2_1; %2 to 0
T_3_0 = T_1_0*T_2_1*T_3_2; %3 to 0
Tcheck = inv(T_0_3); %should be the same as T_3_0

S_0_1 = T_1_0(1:3,3);
S_1_2 = T_2_0(1:3,3);
S_2_3 = T_3_0(1:3,3);
S_3_0 = [0,0,1]';  %for close loop mechanisms last links are [0,0,1]'

S0L1 = cross(T_1_0(1:3,4),S_0_1);
S0L2 = cross(T_2_0(1:3,4),S_1_2);
S0L3 = cross(T_3_0(1:3,4),S_2_3);
S0L4 = cross([0,0,1]',S_3_0);

%Jacobian
%all cylindrical joints become a revolute and a prismatic 
%-w_0_1*[S_0_1;S0L1]=J*[w_1_2,v_1_2,w_2_3,v_2_3,w_3_0,v_3_0]';
%w = [w_1_2,v_1_2,w_2_3,v_2_3,w_3_0,v_3_0]';

temp = [0,0,0]'; %used for constructing the prismatic Jacobian elements
%rev,pris,rev,pris,rev,pris
J = [S_1_2 temp S_2_3 temp S_3_0 temp;S0L2 S_1_2 S0L3 S_2_3 S0L4 S_3_0]; 

%individual joint angluar/linear velocities
w = J\(-w_0_1*[S_0_1;S0L1]);

%find linear velocity of point A v_0_3_A 
%find magnitude of angular velocity w_0_3 (left is "respect to")

w_0_3 = -w(5); %w_0_3 = -w_3_0; 5th term in w
v_0_3_A = -w(6); %v_0_3_A = -v_3_0_A; 6th term in w

v_0_3_Avec = v_0_3_A*S_3_0;
fprintf("(a)linear velocity of point A is : %0.4f m/s\n",v_0_3_A);
fprintf("in vector form: [%0.4f,%0.4f,%0.4f]T m/s\n",v_0_3_Avec(1),v_0_3_Avec(2),v_0_3_Avec(3))
fprintf("(b)magnitude of angular velocity is: %0.4f rad/s\n",w_0_3)
