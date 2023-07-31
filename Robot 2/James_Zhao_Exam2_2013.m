clc;clear;
%% exam 2013
%given 
P_A = [0,0,24];
P_B = [72, 48, 24];
P_C = [0, 96, 96];
P_D = [72, 0, 24];

%fD = 20 i - 40 j - 75k 
f_D = [20,-40,-75];
mmag_D = 320;

%the direction of the moment is parallel to the direction of force fD
m_D = mmag_D*f_D/norm(f_D);

m0_D = cross(P_D,f_D)+m_D;

%line BC 
S1 = unitVector(P_C-P_B)';
S0L1 = cross(P_B,S1);

%free to slide up and down--no force on z
syms fax fay m0ax m0ay m0az T
f_A = [fax, fay, 0];
m_A = cross(P_A,f_A);
m0_A = [m0ax, m0ay, m0az]+m_A;
eqs1 =  f_A+f_D+T*S1;
eqs2 =  m0_A+m0_D+T*S0L1;

[temp1,temp2,temp3,temp4,temp5,temp6] = solve([eqs1 eqs2] == [0,0,0,0,0,0],fax,fay,m0ax,m0ay,m0az,T);
fax = double(temp1);
fay = double(temp2);
m0ax = double(temp3);
m0ay = double(temp4);
m0az = double(temp5);
T = double(temp6);
fprintf("   the wrench on A is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, 0; %0.4f, %0.4f, %0.4f}\n\n",fax,fay,m0ax,m0ay,m0az)
fprintf("   Tensile force is :%0.4f N\n",T);


