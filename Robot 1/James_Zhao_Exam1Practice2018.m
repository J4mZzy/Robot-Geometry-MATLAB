%2018 EXAM1 
clc;clear;

%% Problem 1
T = transformationMatrix(90,[0,1,0],[0,0,0])*transformationMatrix(90,[0,0,1],[0,0,0]);
R = rotationMatrix(T);
[theta,m] = rotationAxisAngle(R);
disp("theta is:")
disp(theta)
disp("m is:")
disp(m)