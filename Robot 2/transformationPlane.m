function [D01_A,S1_A] = transformationPlane(D01_B,S1_B,T_B_A)
%plane transformation from B to A
%outputs a column vector S1_A and a scaler D01_A 

R_B_A = T_B_A(1:3,1:3); %rotation matrix
p_origin_in_B_viewed_in_A = T_B_A(1:3,4); % origin in B viewed_in A

D01_A = D01_B - dot(p_origin_in_B_viewed_in_A,R_B_A*S1_B(:));
S1_A = R_B_A*S1_B(:);
end