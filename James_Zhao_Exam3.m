clc;clear;

%% quaternion problem
q1 = [cosd(90/2) sind(90/2)*unitVector([2,0,5])'];
q2 = [0.4695 0 0.3949 0.7897];

q3 = quaternionMultiplication2(q2,q1);
disp("q3 is: ")
disp(q3)

c = q3(1);
s = norm(q3(2:4));
theta1 = 2*atan2d(s,c);
axis = q3(2:4)'/s;

disp("axis is: ")
disp(axis)

disp("angle is: ")
disp(theta1)


%% problem 4
syms x
eqs = x^2-5*x+((13/11*x^-22.5/11)^2+7*(13/11*x-22.5/11)-6.5);
mypoly = [1+(13/11)^2 -5-2*13*22.5/11/11+7*13/11 (22.5/11)^2-6.5-7*22.5/11];
xroots = roots(mypoly) ;

disp("xroots are: ")
disp(xroots)

yroots = 13/11*xroots-22.5/11;
disp("yroots are: ")
disp(yroots)


