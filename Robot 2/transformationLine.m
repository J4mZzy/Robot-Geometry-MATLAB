function [S1_A,S0l1_A] = transformationLine(S1_B,S0l1_B,T_B_A)
%line transformation from B to A
%outputs two column vectors 

R_B_A = T_B_A(1:3,1:3); %rotation matrix
p_origin_in_B_viewed_in_A = T_B_A(1:3,4); % origin in B viewed_in A
S1_A = R_B_A*S1_B(:);
S0l1_A = cross(p_origin_in_B_viewed_in_A,R_B_A*S1_B(:))+R_B_A*S0l1_B(:);
end
