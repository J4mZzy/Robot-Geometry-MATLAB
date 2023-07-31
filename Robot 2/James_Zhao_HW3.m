clc; clear; %clear work space and command window
%% problem 1
p1_A = [2,8,8,1]'; %point 1 viewed in A
p1_B = [12,20,-8,1]'; %point 1 viewed in B

%approach 1
% syms x y z
% p_translation = [x;y;z];
% T = transformationMatrix(40,[0,0,1],p_translation);  %B to A
% eqs = T*p1_B; %point 1 viewed in A
% [x,y,z] = solve(eqs == p1_A,x,y,z);
% 
% p_translation = [double(x),double(y),double(z)]';
% T = transformationMatrix(40,[0,0,1],p_translation);  %B to A
% p_origin_in_B_viewed_in_A = T*[0,0,0,1]'; %origin of B in A

%approach 2
p_origin_in_B_viewed_in_A = p1_A-transformationMatrix(40,[0,0,1],[0,0,0])*p1_B; %the translation, and the origin of B in A
disp("Problem 2:")
disp('the origin of B in A is:')
disp(p_origin_in_B_viewed_in_A)

%approach 1 and 2 produces the same answer, approach 2 is more efficient


%% problem 2 
p = [10, 20, 10, 1]'; %point passes thorugh
m = unitVector([2,4,6]); %unit vector of the roatation axis
T1 = transformationMatrix(0,[0,0,0],p); %Translation from D to A 
T2 = transformationMatrix(30,[1,0,0],[0,0,0]); %Rotation from E to D
T3 = transformationMatrix(0,[0,0,0],-p); %Translation from B to E
T4 = T1*T2*T3; %B to A
T5 = transformationMatrix(60,m,[0,0,0]); %C to A
T6 = inv(T4)*T5; %C to B

disp("Problem 3:")
disp('the Transformation Matrix is:')
disp(T6)

%% problem 3
phi = 70;
alpha1 = 50;
alpha2 = 90;
a1 = 0;
a2 = 20;
S2 = 50;
S3 = 35;
theta2 = 120;
theta3 = 90;

T7 = transformationMatrix(phi,[0,0,1],[0,0,0]); %1 to F
T8 = transformationMatrixForward(theta2,alpha1,a1,S2); %2 to 1
T9 = transformationMatrixForward(theta3,alpha2,a2,S3); %3 to 2

T10 = T7*T8*T9; %3 to F
p_origin_in_3_viewed_in_3 = [0,0,0,1]'; %origin in 3 viewed in 3
p_origin_in_3_viewed_in_F = T10*p_origin_in_3_viewed_in_3; %origin in 3 viewed in F

disp("Problem 5:")
disp("link 3 coordinate system's origin in the fixed coordinate system is (in cm):")
disp(p_origin_in_3_viewed_in_F)
S_2_3 = T10(1:3,3); %third column is 2S3
a_3_F = T10(1:3,1); %first column is the a3
disp("2S3 in fixed coordinate system is:")
disp(S_2_3)
disp("a3 in fixed coordinate system is:")
disp(a_3_F)


%% problem 4
S1_B = [1, 3, -2]; %l1 direction vector in B
S0l1_B = [4, 0, 2]; %l1 moment vector in B

m2 = unitVector([-2,3,-3]); %unit vector of the roatation axis 
p2 = [3, 3, 0, 1]'; %point passes thorugh
T11 = transformationMatrix(0,[0,0,0],p2); %Translation  
T12 = transformationMatrix(42.5,m2,[0,0,0]);%Rotation
T13 = transformationMatrix(0,[0,0,0],-p2); %Translation back 

T14 = T11*T12*T13; %B to A
[S1_A,S0l1_A] = transformationLine(S1_B,S0l1_B,T14);
disp("Final Problem:")
disp("coordinates of the line in the A coordinate system is:")
disp("Direction (S1 in A):")
disp(S1_A)
disp("Moment (S0L1 in A) (units in m):")
disp(S0l1_A)

