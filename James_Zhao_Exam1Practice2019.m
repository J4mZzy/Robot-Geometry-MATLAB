%2019 EXAM1 
clc;clear;

%% Problem 1

T = [-0.18957,-0.36712,0.91065,4.37685;
     -0.75247,0.65013,0.10545,1.12155;
     -0.63075,-0.66525,-0.39950,-4.26749;
      0 0 0 1]; %B to A
[theta,m] = rotationAxisAngle(rotationMatrix(T));
disp("theta is:")
disp(theta)
disp("m is:")
disp(m)

%%Ax=b
A = [T(1,1)-1,T(1,2),T(1,3);
     T(2,1),T(2,2)-1,T(2,3);
     T(3,1),T(3,2),T(3,3)-1]; 
b = [-T(1,4),-T(2,4),-T(3,4)]';  

x =A\b;
disp("the point is: ")
disp(x)

