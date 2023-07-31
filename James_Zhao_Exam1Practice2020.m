%2020 EXAM1 
clc;clear;

%% Problem 1

%This problem is solved by using the transformation matrix and the final
%translation to find the points 

syms px py pz
P = [px,py,pz];
T1 = transformationMatrix(0,[0,0,0],P);
T2 = transformationMatrix(40,unitVector([3,3,1]),[0,0,0]);
T3 = transformationMatrix(0,[0,0,0],-P);
T = T1*T2*T3;
P2 = [-2.9404, 2.1632, 2.3319]';
S = solve(T(1,4) == P2(1) ,T(2,4) == P2(2),T(3,4) == P2(3),px,py,pz);
P3 = double([S.px;S.py;S.pz]);
disp(P3)

% %%Ax=b
% A = [0.1231,0.0366,-0.4793;
%     -0.2583,0.1231,0.4055;
%      0.4055,-0.4793,0.2216]; %derived from maple
% b = [-2.9404, 2.1632, 2.3319]'; %point translated to 
% 
% x =A\b;
% disp(x)