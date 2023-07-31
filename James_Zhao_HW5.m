clc; clear; %clear workspace and command window
%% problem 6.3

%given quantatities
theta1 = 120; %input angle
alpha12 = 75;
alpha23 = 110;
alpha34 = 60;
alpha41 = 80;

%solve theta2A, theta2B, theta3A, theta3B and theta4A. theta4B
%first one to be solved is going to be theta2
%Z12 -cosd(alpha34) = 0
%Z12 = sind(alpha23)*(X1*s2 + Y1*c2)+cosd(alpha23)*Z1

X1 = sind(alpha41)*sind(theta1);
Y1 = -(sind(alpha12)*cosd(alpha41)+cosd(alpha12)*sind(alpha41)*cosd(theta1));
Z1 = cosd(alpha12)*cosd(alpha41)-sind(alpha12)*sind(alpha41)*cosd(theta1);

%A*c2 + B*c2 + D = 0
A = sind(alpha23)*Y1;
B = sind(alpha23)*X1;
D = cosd(alpha23)*Z1-cosd(alpha34);

%solve for the theta2A and theta2B using the established solveTrig function 
[theta2A, theta2B,c] = solveTrig(A,B,D);

%solve for theta3A and theta3B

%equate the trig law equations to the definition of X12 and Y12 (Buddy equations)
% X12 = sind(alpha34)*s3 = X1*cosd(theta2)-Y1*sind(theta2)
% Y12 = sind(alpha34)*c3 = cosd(alpha23)*(X1*sind(theta2) + Y1*cosd(theta2))-sind(alpha23)*Z1

%the solved equations 
s3A = (X1*cosd(theta2A)-Y1*sind(theta2A))/sind(alpha34);  %theta2A results in theta3A
s3B = (X1*cosd(theta2B)-Y1*sind(theta2B))/sind(alpha34);  %theta2B results in theta3B
c3A = (cosd(alpha23)*(X1*sind(theta2A) + Y1*cosd(theta2A))-sind(alpha23)*Z1)/sind(alpha34); %theta2A results in theta3A
c3B = (cosd(alpha23)*(X1*sind(theta2B) + Y1*cosd(theta2B))-sind(alpha23)*Z1)/sind(alpha34); %theta2B results in theta3B

theta3A = atan2d(s3A,c3A); %theta3A
theta3B = atan2d(s3B,c3B); %theta3B

%solve for theta4A and theta4B

%equate the trig law equations to the definition of X21 and Y21
% X21 = sind(alpha34)*s4 = X2_*cosd(theta1)-Y2_*sind(theta1)
% Y21 = sind(alpha34)*c4 = cosd(alpha41)*(X2_*sind(theta1) + Y2_*cosd(theta1))-sind(alpha41)*Z1
X2_A = sind(alpha23)*sind(theta2A); %X2bar, case A
X2_B = sind(alpha23)*sind(theta2B); %X2bar, case B
Y2_A = -(sind(alpha12)*cosd(alpha23)+cosd(alpha12)*sind(alpha23)*cosd(theta2A)); %Y2bar, case A
Y2_B = -(sind(alpha12)*cosd(alpha23)+cosd(alpha12)*sind(alpha23)*cosd(theta2B)); %Y2bar, case B
Z2_A = cosd(alpha12)*cosd(alpha23)-sind(alpha12)*sind(alpha23)*cosd(theta2A); %Z2bar, case A
Z2_B = cosd(alpha12)*cosd(alpha23)-sind(alpha12)*sind(alpha23)*cosd(theta2B); %Z2bar, case B

%the solved equations 
s4A = (X2_A*cosd(theta1)-Y2_A*sind(theta1))/sind(alpha34);  %theta2A results in theta3A
s4B = (X2_B*cosd(theta1)-Y2_B*sind(theta1))/sind(alpha34);  %theta2B results in theta3B
c4A = (cosd(alpha41)*(X2_A*sind(theta1) + Y2_A*cosd(theta1))-sind(alpha41)*Z2_A)/sind(alpha34); %theta2A results in theta3A
c4B = (cosd(alpha41)*(X2_B*sind(theta1) + Y2_B*cosd(theta1))-sind(alpha41)*Z2_B)/sind(alpha34); %theta2B results in theta3B

theta4A = atan2d(s4A,c4A); %theta3A
theta4B = atan2d(s4B,c4B); %theta3B


%display solutions
fprintf("the first set of solution is:\n")
fprintf("theta2A = %f, theta3A = %f, theta4A = %f\n",theta2A,theta3A,theta4A)
fprintf("the second set of solution is:\n")
fprintf("theta2B = %f, theta3B = %f, theta4B = %f\n",theta2B,theta3B,theta4B)

%equivalent angles(turning the negative angles into positive ones)
if theta2A < 0
    theta2A = theta2A + 360;
end
if theta2B < 0
    theta2B = theta2B + 360;
end
if theta3A < 0
    theta3A = theta3A + 360;
end
if theta3B < 0
    theta3B = theta3B + 360;
end
if theta4A < 0
    theta4A = theta4A + 360;
end
if theta4B < 0
    theta4B = theta4B + 360;
end

fprintf("\n or \n\n")
fprintf("the first set of solution is:\n")
fprintf("theta2A = %f, theta3A = %f, theta4A = %f\n",theta2A,theta3A,theta4A)
fprintf("the second set of solution is:\n")
fprintf("theta2B = %f, theta3B = %f, theta4B = %f\n",theta2B,theta3B,theta4B)



