%%Exam2 
clc; clear;

%given quantatities
P = [15;-12;10]; %point 5 origin in fixed coordinate system
a56_f = [-0.153;0.459;0.875]; %a56 in fixed coordinate system
S5_f = [0.177;0.884;-0.433]; %S5 in fixed coordinate system

[a61,S6,S1,alpha61,theta6,gamma] = closeTheLoop(P,S5_f,a56_f);
disp("a61 is:")
disp(a61)
disp("S6 is:")
disp(S6)
disp("S1 is:")
disp(S1)
disp("alpha61 is:")
disp(alpha61)
disp("theta6 is:")
disp(theta6)
disp("gamma is:")
disp(gamma)


