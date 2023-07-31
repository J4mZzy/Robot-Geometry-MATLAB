clc;clear;
%% exam 2022
%Two wrenches, cylindroid when resultant pitch is 0 find f1/f2 ratio 
%given 2 wrenches
S1 = [-2, 3, 4];
P1 = [1, 1.5, 4];
h1 = 2.5;
S2 = [-2, -3, 6];
P2 = [-1, -1.5 2];
h2 = -3.5;

%find the line l1 (from l2 you can find screw 1)
S0L1 = cross(P1,S1); %l1 is defined
%find the line l2 (from l2 you can find screw 2)
S0L2 = cross(P2,S2); %l2 is defined

[mm, a12, alpha12, a12d,~,~,~] = mutual_moment(S1,S0L1,S2,S0L2);
[R,s_sigma,c_sigma] = cylindroid(h1,h2,a12d,alpha12);

sigma = atan2d(s_sigma,c_sigma);

%h = h1 + R(c_sigma-cosd(2*si-sigma));
%if h = 0, we will have -h1 = R(c_sigma-cosd(2*si-sigma));
%c_sigma + h1/R = cosd(2*si-sigma);
%acosd(c_sigma + h1/R) = 2*si-sigma
c_temp = c_sigma + h1/R;
si1 = (acosd(c_temp) + sigma)/2;
si2 = (-acosd(c_temp) + sigma)/2;

% si1 = (acosd(c_sigma + h1/R)+sigma)/2;

ratio1 = sind(alpha12-si1)/sind(si1); % case 1 
ratio2 = sind(alpha12-si2)/sind(si2); % case 2

fprintf("when the pitch is 0, the ratio f1/f2 is: %0.4f or %0.4f\n",ratio1,ratio2)


