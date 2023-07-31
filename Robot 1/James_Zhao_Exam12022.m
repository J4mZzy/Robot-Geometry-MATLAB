   clc;clear;
T1 = transformationMatrix(90,[1,0,0],[10,-5,20]); %translation, and,90 degree around x
theta = 90 + atand(0.44721/0.89443);
T2 = transformationMatrix(theta,[0,1,0],[0,0,0]); %theta degree around y
% T3 = transformationMatrix(0,[0,0,0],[10,-5,20]); 
T4 = T1*T2; %T 1 to Fixed

T9 = inv(T4); %Fixed to 1
P_A = [1,0,5,1]'; %point A in F
P_E = [-2,3,1,1]'; %point E in F
m = unitVector([-1,3,2]); % m in F in unit vector form
P1_A = T9*P_A; %point A in 1
P1_E = T9*P_E; %point E in 1
m1 = rotationMatrix(T9)*m;    %m in 1

T5 = transformationMatrix(0,[0,0,0],P1_A); %translate
T6 = transformationMatrix(75,m1,[0,0,0]);%roatate around m(in 1)
T7 = transformationMatrix(0,[0,0,0],-P1_A);%translate back

T8 = T5*T6*T7; %T1 to 2
T10 = transformationMatrix(0,[0,0,0],5*m1);
P2_E = inv(T10*T8)*P1_E; %point E in 2 after translating 5 along m
disp("Point E in 2 is:")
disp(P2_E)