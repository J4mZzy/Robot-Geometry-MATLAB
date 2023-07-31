clc;clear;

%% rotation angle and axis
%quarternion calculation
% q1 = [cosd(60/2) sind(60/2)*unitVector([3,2,0])'];
% q2 = [cosd(115/2) sind(115/2)*unitVector([0,-1,2])'];


% q3 = quaternionMultiplication2(q2,q1);  %sequence matters!
% c = q3(1);
% s = norm(q3(2:4));
% theta1 = 2*atan2d(s,c);
% axis = q3(2:4)'/s;

%to return to the original position, do theta2 with the same axis
% theta2 = -theta1;

%% rotated point 
% q1inv = quaternionInverse(q1);
% q2inv = quaternionInverse(q2);
% q3inv = quaternionMultiplication2(q1inv,q2inv); %sequence matters!
% check1 = quaternionMultiplication2(q1,q1inv);
% check2 = quaternionMultiplication2(q2,q2inv);
% check3 = quaternionMultiplication2(q3,q3inv);
% 
% r2 = quaternionMultiplication3(q3,[5,2,3]);
% 
% temp =  quaternionMultiplication3(q1,[5,2,3]);
% checkr2 = quaternionMultiplication3(q2,temp);
% 
% disp(r2)
% disp(checkr2)

%% exam3 2021 
% q1 = [cosd(50/2) sind(50/2)*unitVector([0,0,1])'];
% q2 = [cosd(90/2) sind(90/2)*unitVector([0,1,0])'];
% q3 = [cosd(30/2) sind(30/2)*unitVector([1,0,0])'];
% temp = quaternionMultiplication2(q3,q2);  %sequence matters!
% q4 = quaternionMultiplication2(temp,q1);
% disp("q4 is: ")
% disp(q4)
% 
% c = q4(1);
% s = norm(q4(2:4));
% theta1 = 2*atan2d(s,c);
% axis = q4(2:4)'/s;
% 
% disp("axis is: ")
% disp(axis)
% 
% disp("angle is: ")
% disp(theta1)

%% exam3 2020
% q1 = [cosd(50/2) sind(50/2)*unitVector([1,2,0])'];
% q3 = [cosd(50/2) sind(50/2)*unitVector([2,1,0])'];
% 
% q1inv = quaternionInverse(q1);
% q3inv = quaternionInverse(q3);
% q2 = quaternionMultiplication2(q3inv,q1inv);
% 
% disp("q2 is: ")
% disp(q2)
% 
% c = q2(1);
% s = norm(q2(2:4));
% theta1 = 2*atan2d(s,c);
% axis = q2(2:4)'/s;
% 
% disp("axis is: ")
% disp(axis)
% 
% disp("angle is: ")
% disp(theta1)

%% exam3 2016
q1 = [cosd(90/2) sind(90/2)*unitVector([1,0,0])'];
q2 = [cosd(40/2) sind(40/2)*unitVector([0,1,0])'];
q4 = [cosd(90/2) sind(90/2)*unitVector([0,0,1])'];
 
q1inv = quaternionInverse(q1);
q2inv = quaternionInverse(q2);

q3 = quaternionMultiplication2(quaternionMultiplication2(q4,q1inv),q2inv);
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