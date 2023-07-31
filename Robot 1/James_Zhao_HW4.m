clc; clear; %clear workspace and command window
%% Main function for the close the loop analysis
P_6 = [5,3,7]'; %tool point in 6
P_f = [25,23,24]'; %tool point in fixed 
S6_f = [0.177,0.884,-0.433]'; %S6 in fixed
a67_f = [-0.153,0.459,0.875]'; %a67 in fixed

[a71,S7,S1,alpha,theta,gamma] = closeTheLoop(P_6,P_f,S6_f,a67_f);
disp("a71 is:")
disp(a71)
disp("S7 is:")
disp(S7)
disp("S1 is:")
disp(S1)
disp("alpha71 is:")
disp(alpha)
disp("theta7 is:")
disp(theta)
disp("gamma1 is:")
disp(gamma)