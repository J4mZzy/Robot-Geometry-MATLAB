function [a,b,c] = solveTrig(A,B,D)
%This is the trigonometric solution of Ac + Bs + D = 0
%c = 1 when the solutionn is valid, c = 0 when the solution is invalid

%NOTE: the value of -D/sqrt(A^2+B^2) needs to be between -1 and 1 for the
%solutions to be real

gamma = atan2d(B,A); %gamma
temp = abs(-D/sqrt(A^2+B^2)); %dertermine if c is valid 
c = 1; %initialize as true

%check if the solutions are valid, only valid when temp is between -1 and 1
if temp > 1
  c = 0;
end

a = acosd(-D/sqrt(A^2+B^2))+gamma; %the first solution 
b = -acosd(-D/sqrt(A^2+B^2))+gamma; %the second solution

end