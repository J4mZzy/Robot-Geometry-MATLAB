clc; clear; %clear workspace and command window
%% problem 2.9
%Transformation from C to A, 35 degree about X axis
T1 = transformationMatrix(35,[1,0,0],[0,0,0]); 

%Transformation from B to C, 120 degree about Y axis
T2 = transformationMatrix(120,[0,1,0],[0,0,0]);

%Transformation from B to A
T3 = T1*T2;

%Rotation from B to A
R = rotationMatrix(T3);

%Rotation angle and axis
[theta, m] = rotationAxisAngle(R);

%Rotation axis

disp("The rotation axis is:")
disp(m)
disp("The rotation angle in degree is:")
%*******To Rotate back, roatate with the same axis with a NEGATIVE angle
disp(-theta)



