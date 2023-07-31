clc;clear;
%% exam 2023

p1 = [1.2,3.1,0];
p2 = [-1,3.6,0];
p3 = [-1.5,-3.4,0];

theta1 = 35;
theta2 = 131.5;
theta3 = 174;

%find S01,S02, and S03

xAxis = [1;0;0;1]; %define x-axis
S01 = transformationMatrix(theta1,[0,0,1],[0,0,0])*xAxis;
S02 = transformationMatrix(theta2,[0,0,1],[0,0,0])*xAxis;
S03 = transformationMatrix(theta3,[0,0,1],[0,0,0])*xAxis;

%% part (a)
syms f1 f2 f3
% moment = cross(p,f)

f1_vec = f1*[S01(1) S01(2) S01(3)];
f2_vec = f2*[S02(1) S02(2) S02(3)];
f3_vec = f3*[S03(1) S03(2) S03(3)];

eqs1 = f1_vec+f2_vec+f3_vec;   %sum of the forces is [0, 0, 0]
eqs2 = cross(p1,f1_vec)+cross(p2,f2_vec)+cross(p3,f3_vec);   %sum of the momemt is [0, 0, 126]

[temp1,temp2,temp3] = solve([eqs1 eqs2] == [0,0,0,0,0,126],f1,f2,f3); %solve!

f1 = double(temp1); 
f2 = double(temp2);
f3 = double(temp3);
fprintf("(a) the force magnitudes for the three thrusters are: %0.4f N, %0.4f N, %0.4f N\n\n",f1,f2,f3);

%check
f1_vec = f1*[S01(1) S01(2) S01(3)];
f2_vec = f2*[S02(1) S02(2) S02(3)];
f3_vec = f3*[S03(1) S03(2) S03(3)];

check1 = f1_vec+f2_vec+f3_vec;
check2 = cross(p1,f1_vec)+cross(p2,f2_vec)+cross(p3,f3_vec);
%checks out!

%% part (b)
syms f1 f2 f3
% moment = cross(p,f)

f1_vec = f1*[S01(1) S01(2) S01(3)];
f2_vec = f2*[S02(1) S02(2) S02(3)];
f3_vec = f3*[S03(1) S03(2) S03(3)];

eqs1 = f1_vec+f2_vec+f3_vec;   %sum of the forces is [42, 22, 0]
eqs2 = cross(p1,f1_vec)+cross(p2,f2_vec)+cross(p3,f3_vec);   %sum of the momemt is [0, 0, 0]

[temp1,temp2,temp3] = solve([eqs1 eqs2] == [42,22,0,0,0,0],f1,f2,f3); %solve!

f1 = double(temp1); 
f2 = double(temp2);
f3 = double(temp3);
fprintf("(b) the force magnitudes for the three thrusters are: %0.4f N, %0.4f N, %0.4f N\n\n",f1,f2,f3);

%check
f1_vec = f1*[S01(1) S01(2) S01(3)];
f2_vec = f2*[S02(1) S02(2) S02(3)];
f3_vec = f3*[S03(1) S03(2) S03(3)];

check3 = f1_vec+f2_vec+f3_vec;
check4 = cross(p1,f1_vec)+cross(p2,f2_vec)+cross(p3,f3_vec);
%checks out!

%% part (c)
syms theta1 theta2 theta3
M = [cos(theta1), cos(theta2), cos(theta3); 
     sin(theta1), sin(theta2), sin(theta3); 
     1.2*sin(theta1)-3.1*cos(theta1), -sin(theta2)-3.6*cos(theta2), -1.5*sin(theta3)+3.4*cos(theta3)];

eqs3 = det(M);
%to make the matrix linearly dependent
[theta1] = solve(eqs3 == 0,theta1); %solve!
[theta2] = solve(eqs3 == 0,theta2); %solve!
[theta3] = solve(eqs3 == 0,theta3); %solve!
% 
% fprintf("(c) three conditions for the directions of the three thrusters are: \n");
% theta1
% theta2
% theta3 

%% See MAPLE file for the symbolic solver
fprintf("(c) See Maple PDF attachment");

