%%Exam2 2019 problem2
clc;clear;
%solveing for theta 1A and theta 1B
alpha12 = 58;
alpha23 = 80;
alpha34 = 21;
alpha41 = 90;
theta4 = 82.67; %input angle

X4 = sind(alpha34)*sind(theta4);
Y4 = -(sind(alpha41)*cosd(alpha34)+cosd(alpha41)*sind(alpha34)*cosd(theta4));
Z4 = cosd(alpha41)*cosd(alpha34)-sind(alpha41)*sind(alpha34)*cosd(theta4);

A = sind(alpha12)*Y4;
B = sind(alpha12)*X4;
D = cosd(alpha12)*Z4-cosd(alpha23);

%solve for the theta1A and theta1B using the established solveTrig function 
[theta1A, theta1B,c] = solveTrig(A,B,D);

fprintf("the theta1A is:\n")
fprintf("theta1A = %f",theta1A)
fprintf("\nthe theta1B is:\n")
fprintf("theta1B = %f\n",theta1B)