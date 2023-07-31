function [S_A,S0_A] = transformationScrew(S_B,S0_B,T_B_A)
%Screw transformation from B to A
%outputs two column vectors 

R_B_A = T_B_A(1:3,1:3); %rotation matrix
p_origin_in_B_viewed_in_A = T_B_A(1:3,4); % origin in B viewed_in A
S_A = R_B_A*S_B(:);
S0_A = R_B_A*S0_B(:)+cross(p_origin_in_B_viewed_in_A,R_B_A*S_B(:));
end