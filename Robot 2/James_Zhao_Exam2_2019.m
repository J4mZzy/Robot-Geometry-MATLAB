clc;clear;
%% exam 2019
%given 
P_A = [0,0,1];
P_B = [2*cosd(30), -2*sind(30), 1];
P_C = [4*cosd(30), -4*sind(30), 1];
P_D = [2, 2, 0];

%determine the force vectors on A, B and C 

%line BD (tensile force on BD is to be solved)
S1 = unitVector(P_D-P_B)';
S0L1 = cross(P_B,S1);

%line of force on C, magnitude is given as 200N
S2 = [0, -1, 0];
S0L2 = cross(P_C,S2);
f_C = 200*S2; %force on C
m0_C = 200*S0L2; %moment on C

%an arbiruary force is applied on A f_A = [fax, fay, faz]
%the moment on A is described as m0_A = cross(P_A,f_A)

%the sum of moments and forces together is 0
syms fax fay faz T mAx mAy
f_A = [fax, fay, faz];
m0_A = cross(P_A,f_A) + [mAx, mAy, 0];
f_B = T*S1;
m0_B = T*S0L1; 

eqs1 = f_B(1)+f_C(1)+f_A(1);
eqs2 = f_B(2)+f_C(2)+f_A(2);
eqs3 = f_B(3)+f_C(3)+f_A(3);
eqs4 = m0_B(1)+m0_C(1)+m0_A(1);
eqs5 = m0_B(2)+m0_C(2)+m0_A(2);
eqs6 = m0_B(3)+m0_C(3)+m0_A(3);
[temp1,temp2,temp3,temp4,temp5,temp6] = solve(eqs1 == 0,eqs2 == 0,eqs3 == 0,eqs4 == 0,eqs5 == 0,eqs6 == 0,fax,fay,faz,T,mAx,mAy);
fax = double(temp1);
fay = double(temp2);
faz = double(temp3);
T = double(temp4);
mAx = double(temp5);
mAy = double(temp6);
fprintf("   the tensile force in the rope is: %0.4f N\n\n",T)

%the force on A and moment on A 
f_A = [fax, fay, faz];
m0_A = cross(P_A,f_A) + [mAx, mAy, 0];
[ma,mt,magf,S,S0L,h] = dyname_to_wrench(f_A,m0_A);
fprintf("   the equivalent wrench on A is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_A(1),f_A(2),f_A(3),m0_A(1),m0_A(2),m0_A(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_A(1),f_A(2),f_A(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

fprintf("   the magnitude of the force along the wrench is: %0.4f N\n",magf) 
fprintf("   line of action of the wrench is: ")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))
fprintf("   the pitch of the wrench is: %0.4f m\n\n",h)



