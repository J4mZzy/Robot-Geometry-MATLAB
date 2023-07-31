%2021 EXAM1 
clc;clear;

%% Problem 1
P1 = [2,4,-5,1]'; %P1 IN A
m = unitVector([2,3,4]); %m IN A
P2 = [5,3,5,1]'; %P2 viewed in A

T1 = transformationMatrix(0,[0,0,0],P1)*transformationMatrix(35,[1,0,0],[0,0,0]);  %C to A 

%Find the m and P2 in C
m_d = rotationMatrix(inv(T1))*m; %m in C
P2_d = inv(T1)*P2;%P2 in C

T2 = transformationMatrix(0,[0,0,0],P2_d); %D to C
T3 = transformationMatrix(75,m_d,[0,0,0]); % E to D
T4 = transformationMatrix(0,[0,0,0],-P2_d); %B to E
T5 = T1*T2*T3*T4; % B to A 
disp(T5)

