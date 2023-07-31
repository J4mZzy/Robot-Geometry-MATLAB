clc;clear;
%% exam 2016
%given 
P_A = [0,80,0];
P_B = [-80, 120, 0];
P_C = [-80, 80, -30];
P_D = [0, 0, 0];

P_CG = [0,30,0];
P_ext = [0,40,0];

%blimp weights 3000lb f_CG = [-3000, 0, 0];
%F = 3500i+200j+300k f_ext = [3500, 200, 300];

%lines AC, AB
S1 = unitVector(P_B-P_A)';
S0L1 = cross(P_A,S1);

S2 = unitVector(P_C-P_A)';
S0L2 = cross(P_A,S2);

f_CG = [-3000, 0, 0];
f_ext = [3500, 200, 300];

%dyname f_CG
m0_CG = cross(P_CG,f_CG);

%dyname f_ext
m0_ext = cross(P_ext,f_ext);

syms fdx fdy fdz f_AB f_AC
f_D = [fdx, fdy, fdz];
eqs1 = f_D + f_CG + f_ext + f_AB*S1 + f_AC*S2;
eqs2 = m0_CG + m0_ext + f_AB*S0L1 + f_AC*S0L2;

[temp1,temp2,temp3,temp4,temp5] = solve([eqs1 eqs2] == [0,0,0,0,0,0],fdx,fdy,fdz,f_AB,f_AC);

fdx = double(temp1)
fdy = double(temp2)
fdz = double(temp3)
f_AB = double(temp4)
f_AC = double(temp5)

%yay solved :)






