%%Exam 2 2020
clc;clear;
a12 = 3;
a23 = 3;
a34 = 4.25;
a45 = 3;
a56 = 3.5;
a61 = 3;
alpha12 =270;
alpha23 = 330;
alpha34 = 45;
alpha45 = 150;
alpha56 = 325;
alpha61 = 240;
S1 = 3.3;
S2 = 3.3;
S6 = 3.3;
theta3 = 0;
theta5 = 40;
theta6 = 105;

%% theta 1A and theta 1B
X5 = sind(alpha45)*sind(theta5);
Y5 = -(sind(alpha56)*cosd(alpha45)+cosd(alpha56)*sind(alpha45)*cosd(theta5));
Z5 = cosd(alpha56)*cosd(alpha45)-sind(alpha56)*sind(alpha45)*cosd(theta5);

A = sind(alpha12)*(cosd(alpha61)*(X5*sind(theta6)+Y5*cosd(theta6))-sind(alpha61)*Z5);
B = sind(alpha12)*(X5*cosd(theta6) - Y5*sind(theta6));
D = cosd(alpha12)*(sind(alpha61)*(X5*sind(theta6)+Y5*cosd(theta6))+cosd(alpha61)*Z5)-cosd(alpha23)*cosd(alpha34)+sind(alpha23)*sind(alpha34)*cosd(theta3);

%solve for the theta1A and theta1B using the established solveTrig function 
[theta1A, theta1B,c] = solveTrig(A,B,D);

%% theta 2A  and theta 2B

syms s2 c2
X_3 = sind(alpha34)*sind(theta3);
Y_3 = -(sind(alpha23)*cosd(alpha34)+cosd(alpha23)*sind(alpha34)*cosd(theta3));
Z_3 = cosd(alpha23)*cosd(alpha34)-sind(alpha23)*sind(alpha34)*cosd(theta3);

X32 = X_3*c2-Y_3*s2;
Y32 = cosd(alpha12)*(X_3*s2+Y_3*c2)-sind(alpha12)*Z_3;
Z32 = sind(alpha12)*(X_3*s2+Y_3*c2)+cosd(alpha12)*Z_3;

%first case A
X321A = X32*cosd(theta1A)-Y32*sind(theta1A);
Y321A = cosd(alpha61)*(X32*sind(theta1A)+Y32*cosd(theta1A))-sind(alpha61)*Z32;

X3216A = X321A*cosd(theta6)-Y321A*sind(theta6);
X3216StarA = X321A*sind(theta6)+Y321A*cosd(theta6);

eq1 = X3216A - X5;
eq2 = -X3216StarA - Y5;
[s2A,c2A] = solve(eq1 == 0,eq2 == 0,s2,c2);
theta2A = double(atan2d(s2A,c2A));


%second case B
X321B = X32*cosd(theta1B)-Y32*sind(theta1B);
Y321B = cosd(alpha61)*(X32*sind(theta1B)+Y32*cosd(theta1B))-sind(alpha61)*Z32;

X3216B = X321B*cosd(theta6)-Y321B*sind(theta6);
X3216StarB = X321B*sind(theta6)+Y321B*cosd(theta6);

eq3 = X3216B - X5;
eq4 = -X3216StarB - Y5;
[s2B,c2B] = solve(eq3 == 0,eq4 == 0,s2,c2);
theta2B = double(atan2d(s2B,c2B));


%% theta 4A and theta 4B
syms s4 c4

X3 =sind(alpha23)*sind(theta3);
Y3 = -(sind(alpha34)*cosd(alpha23)+cosd(alpha34)*sind(alpha23)*cosd(theta3));
X34 = X3*c4-Y3*s4;
X34Star = X3*s4 +Y3*c4;

%first case A
X_1A = sind(alpha12)*sind(theta1A);
Y_1A = -(sind(alpha61)*cosd(alpha12)+cosd(alpha61)*sind(alpha12)*cosd(theta1A));
Z_1A = cosd(alpha61)*cosd(alpha12)-sind(alpha61)*sind(alpha12)*cosd(theta1A);

X16A = X_1A*cosd(theta6)-Y_1A*sind(theta6);
Y16A = cosd(alpha56)*(X_1A*sind(theta6)+Y_1A*cosd(theta6))-sind(alpha56)*Z_1A;
Z16A = sind(alpha56)*(X_1A*sind(theta6)+Y_1A*cosd(theta6))+cosd(alpha56)*Z_1A;

X165A = X16A*cosd(theta5)-Y16A*sind(theta5);
Y165A = cosd(alpha45)*(X16A*sind(theta5)+Y16A*cosd(theta5))-sind(alpha45)*Z16A;

eq5 = X165A - X34;
eq6 = Y165A + X34Star;
[s4A,c4A] = solve(eq5 == 0,eq6 == 0,s4,c4);
theta4A = double(atan2d(s4A,c4A));


%second case B
X_1B = sind(alpha12)*sind(theta1B);
Y_1B = -(sind(alpha61)*cosd(alpha12)+cosd(alpha61)*sind(alpha12)*cosd(theta1B));
Z_1B = cosd(alpha61)*cosd(alpha12)-sind(alpha61)*sind(alpha12)*cosd(theta1B);

X16B = X_1B*cosd(theta6)-Y_1B*sind(theta6);
Y16B = cosd(alpha56)*(X_1B*sind(theta6)+Y_1B*cosd(theta6))-sind(alpha56)*Z_1B;
Z16B = sind(alpha56)*(X_1B*sind(theta6)+Y_1B*cosd(theta6))+cosd(alpha56)*Z_1B;

X165B = X16B*cosd(theta5)-Y16B*sind(theta5);
Y165B = cosd(alpha45)*(X16B*sind(theta5)+Y16B*cosd(theta5))-sind(alpha45)*Z16B;

eq7 = X165B - X34;
eq8 = Y165B + X34Star;
[s4B,c4B] = solve(eq7 == 0,eq8 == 0,s4,c4);
theta4B = double(atan2d(s4B,c4B));

%% link lengths

%3 link lengths S3,S4,S5
syms S3 S4 S5
%3 equations for 2 cases(6 equations in total)

%% case A

%vector S1
X2 = sind(alpha12)*sind(theta2A);
Y2 = -(sind(alpha23)*cosd(alpha12)+cosd(alpha23)*sind(alpha12)*cosd(theta2A));
Z2 = cosd(alpha23)*cosd(alpha12)-sind(alpha23)*sind(alpha12)*cosd(theta2A);

X23 = X2*cosd(theta3)-Y2*sind(theta3);
Y23 = cosd(alpha34)*(X2*sind(theta3)+Y2*cosd(theta3))-sind(alpha34)*Z2;
Z23 = sind(alpha34)*(X2*sind(theta3)+Y2*cosd(theta3))+cosd(alpha34)*Z2;

X234 = X23*cosd(theta4A)-Y23*sind(theta4A);
Y234 = cosd(alpha45)*(X23*sind(theta4A)+Y23*cosd(theta4A))-sind(alpha45)*Z23;
Z234 = sind(alpha45)*(X23*sind(theta4A)+Y23*cosd(theta4A))+cosd(alpha45)*Z23;

X2345 = X234*cosd(theta5)-Y234*sind(theta5);
Y2345 = cosd(alpha56)*(X234*sind(theta5)+Y234*cosd(theta5))-sind(alpha56)*Z234;
Z2345 = sind(alpha56)*(X234*sind(theta5)+Y234*cosd(theta5))+cosd(alpha56)*Z234;

%vector a12
U23 = sind(theta2A)*sind(alpha23);
V23 = -(sind(theta3)*cosd(theta2A)+cosd(theta3)*sind(theta2A)*cosd(alpha23));
W23 = cosd(theta3)*cosd(theta2A)-sind(theta3)*sind(theta2A)*cosd(alpha23);

U234 = U23*cosd(alpha34)-V23*sind(alpha34);
V234 = cosd(theta4A)*(U23*sind(alpha34)+V23*cosd(alpha34))-sind(theta4A)*W23;
W234 = sind(theta4A)*(U23*sind(alpha34)+V23*cosd(alpha34))+cosd(theta4A)*W23;

U2345 = U234*cosd(alpha45)-V234*sind(alpha45);
V2345 = cosd(theta5)*(U234*sind(alpha45)+V234*cosd(alpha45))-sind(theta5)*W234;

W2345 = sind(theta5)*(U234*sind(alpha45)+V234*cosd(alpha45))+cosd(theta5)*W234;
U23456Star = U2345*sind(alpha56)+V2345*cosd(alpha56);
U23456 = U2345*cosd(alpha56)-V2345*sind(alpha56);

%vector S2
X3 = sind(alpha23)*sind(theta3);
Y3 = -(sind(alpha34)*cosd(alpha23)+cosd(alpha34)*sind(alpha23)*cosd(theta3));
Z3 = cosd(alpha34)*cosd(alpha23)-sind(alpha34)*sind(alpha23)*cosd(theta3);

X34 = X3*cosd(theta4A)-Y3*sind(theta4A);
Y34 = cosd(alpha45)*(X3*sind(theta4A)+Y3*cosd(theta4A))-sind(alpha45)*Z3;
Z34 = sind(alpha45)*(X3*sind(theta4A)+Y3*cosd(theta4A))+cosd(alpha45)*Z3;

X345 = X34*cosd(theta5)-Y34*sind(theta5);
Y345 = cosd(alpha56)*(X34*sind(theta5)+Y34*cosd(theta5))-sind(alpha56)*Z34;
Z345 = sind(alpha56)*(X34*sind(theta5)+Y34*cosd(theta5))+cosd(alpha56)*Z34;

%vector a23
U34 = sind(theta3)*sind(alpha34);
V34 = -(sind(theta4A)*cosd(theta3)+cosd(theta4A)*sind(theta3)*cosd(alpha34));
W34 = cosd(theta4A)*cosd(theta3)-sind(theta4A)*sind(theta3)*cosd(alpha34);

U345 = U34*cosd(alpha45)-V34*sind(alpha45);
V345 = cosd(theta5)*(U34*sind(alpha45)+V34*cosd(alpha45))-sind(theta5)*W34;

W345 = sind(theta5)*(U34*sind(alpha45)+V34*cosd(alpha45))+cosd(theta5)*W34;
U3456Star = U345*sind(alpha56)+V345*cosd(alpha56);
U3456 = U345*cosd(alpha56)-V345*sind(alpha56);

%vector S3
X4 = sind(alpha34)*sind(theta4A);
Y4 = -(sind(alpha45)*cosd(alpha34)+cosd(alpha45)*sind(alpha34)*cosd(theta4A));
Z4 = cosd(alpha45)*cosd(alpha34)-sind(alpha45)*sind(alpha34)*cosd(theta4A);

X45 = X4*cosd(theta5)-Y4*sind(theta5);
Y45 = cosd(alpha56)*(X4*sind(theta5)+Y4*cosd(theta5))-sind(alpha56)*Z4;
Z45 = sind(alpha56)*(X4*sind(theta5)+Y4*cosd(theta5))+cosd(alpha56)*Z4;

%vector a34
U45 = sind(theta4A)*sind(alpha45);
V45 = -(sind(theta5)*cosd(theta4A)+cosd(theta5)*sind(theta4A)*cosd(alpha45));

W45 = cosd(theta5)*cosd(theta4A)-sind(theta5)*sind(theta4A)*cosd(alpha45);
U456Star = U45*sind(alpha56)+V45*cosd(alpha56);
U456= U45*cosd(alpha56)-V45*sind(alpha56);

%vector S4
%defined previously

%vector a45 
%only U56 needs to be defined
U56 = sind(theta5)*sind(alpha56);

%solve
eq9 = S1*X2345+a12*W2345+S2*X345+a23*W345+S3*X45+a34*W45+S4*X5+a45*cosd(theta5)+S5*0+a56*1+S6*0+a61*cosd(theta6);
eq10 = S1*-Y2345+a12*U23456Star+S2*-Y345+a23*U3456Star+S3*-Y45+a34*U456Star+S4*-Y5+a45*-sind(theta5)*cosd(alpha56)+S5*sind(alpha56)+a56*0+S6*0+a61*sind(theta6);
eq11 = S1*Z2345+a12*U23456+S2*Z345+a23*U3456+S3*Z45+a34*U456+S4*Z5+a45*U56+S5*cosd(alpha56)+a56*0+S6*1+a61*0;
[S3A,S4A,S5A] = solve(eq9 == 0,eq10 == 0,eq11 == 0,S3,S4,S5);

%% case B
%vector S1
X2 = sind(alpha12)*sind(theta2B);
Y2 = -(sind(alpha23)*cosd(alpha12)+cosd(alpha23)*sind(al ...
    pha12)*cosd(theta2B));
Z2 = cosd(alpha23)*cosd(alpha12)-sind(alpha23)*sind(alpha12)*cosd(theta2B);

X23 = X2*cosd(theta3)-Y2*sind(theta3);
Y23 = cosd(alpha34)*(X2*sind(theta3)+Y2*cosd(theta3))-sind(alpha34)*Z2;
Z23 = sind(alpha34)*(X2*sind(theta3)+Y2*cosd(theta3))+cosd(alpha34)*Z2;

X234 = X23*cosd(theta4B)-Y23*sind(theta4B);
Y234 = cosd(alpha45)*(X23*sind(theta4B)+Y23*cosd(theta4B))-sind(alpha45)*Z23;
Z234 = sind(alpha45)*(X23*sind(theta4B)+Y23*cosd(theta4B))+cosd(alpha45)*Z23;

X2345 = X234*cosd(theta5)-Y234*sind(theta5);
Y2345 = cosd(alpha56)*(X234*sind(theta5)+Y234*cosd(theta5))-sind(alpha56)*Z234;
Z2345 = sind(alpha56)*(X234*sind(theta5)+Y234*cosd(theta5))+cosd(alpha56)*Z234;

%vector a12
U23 = sind(theta2B)*sind(alpha23);
V23 = -(sind(theta3)*cosd(theta2B)+cosd(theta3)*sind(theta2B)*cosd(alpha23));
W23 = cosd(theta3)*cosd(theta2B)-sind(theta3)*sind(theta2B)*cosd(alpha23);

U234 = U23*cosd(alpha34)-V23*sind(alpha34);
V234 = cosd(theta4B)*(U23*sind(alpha34)+V23*cosd(alpha34))-sind(theta4B)*W23;
W234 = sind(theta4B)*(U23*sind(alpha34)+V23*cosd(alpha34))+cosd(theta4B)*W23;

U2345 = U234*cosd(alpha45)-V234*sind(alpha45);
V2345 = cosd(theta5)*(U234*sind(alpha45)+V234*cosd(alpha45))-sind(theta5)*W234;

W2345 = sind(theta5)*(U234*sind(alpha45)+V234*cosd(alpha45))+cosd(theta5)*W234;
U23456Star = U2345*sind(alpha56)+V2345*cosd(alpha56);
U23456 = U2345*cosd(alpha56)-V2345*sind(alpha56);

%vector S2
X3 = sind(alpha23)*sind(theta3);
Y3 = -(sind(alpha34)*cosd(alpha23)+cosd(alpha34)*sind(alpha23)*cosd(theta3));
Z3 = cosd(alpha34)*cosd(alpha23)-sind(alpha34)*sind(alpha23)*cosd(theta3);

X34 = X3*cosd(theta4B)-Y3*sind(theta4B);
Y34 = cosd(alpha45)*(X3*sind(theta4B)+Y3*cosd(theta4B))-sind(alpha45)*Z3;
Z34 = sind(alpha45)*(X3*sind(theta4B)+Y3*cosd(theta4B))+cosd(alpha45)*Z3;

X345 = X34*cosd(theta5)-Y34*sind(theta5);
Y345 = cosd(alpha56)*(X34*sind(theta5)+Y34*cosd(theta5))-sind(alpha56)*Z34;
Z345 = sind(alpha56)*(X34*sind(theta5)+Y34*cosd(theta5))+cosd(alpha56)*Z34;

%vector a23
U34 = sind(theta3)*sind(alpha34);
V34 = -(sind(theta4B)*cosd(theta3)+cosd(theta4B)*sind(theta3)*cosd(alpha34));
W34 = cosd(theta4B)*cosd(theta3)-sind(theta4B)*sind(theta3)*cosd(alpha34);

U345 = U34*cosd(alpha45)-V34*sind(alpha45);
V345 = cosd(theta5)*(U34*sind(alpha45)+V34*cosd(alpha45))-sind(theta5)*W34;

W345 = sind(theta5)*(U34*sind(alpha45)+V34*cosd(alpha45))+cosd(theta5)*W34;
U3456Star = U345*sind(alpha56)+V345*cosd(alpha56);
U3456 = U345*cosd(alpha56)-V345*sind(alpha56);

%vector S3
X4 = sind(alpha34)*sind(theta4B);
Y4 = -(sind(alpha45)*cosd(alpha34)+cosd(alpha45)*sind(alpha34)*cosd(theta4B));
Z4 = cosd(alpha45)*cosd(alpha34)-sind(alpha45)*sind(alpha34)*cosd(theta4B);

X45 = X4*cosd(theta5)-Y4*sind(theta5);
Y45 = cosd(alpha56)*(X4*sind(theta5)+Y4*cosd(theta5))-sind(alpha56)*Z4;
Z45 = sind(alpha56)*(X4*sind(theta5)+Y4*cosd(theta5))+cosd(alpha56)*Z4;

%vector a34
U45 = sind(theta4B)*sind(alpha45);
V45 = -(sind(theta5)*cosd(theta4B)+cosd(theta5)*sind(theta4B)*cosd(alpha45));

W45 = cosd(theta5)*cosd(theta4B)-sind(theta5)*sind(theta4B)*cosd(alpha45);
U456Star = U45*sind(alpha56)+V45*cosd(alpha56);
U456= U45*cosd(alpha56)-V45*sind(alpha56);

%vector S4
%defined previously

%vector a45 
%only U56 needs to be defined
U56 = sind(theta5)*sind(alpha56);

%solve
eq9 = S1*X2345+a12*W2345+S2*X345+a23*W345+S3*X45+a34*W45+S4*X5+a45*cosd(theta5)+S5*0+a56*1+S6*0+a61*cosd(theta6);
eq10 = S1*-Y2345+a12*U23456Star+S2*-Y345+a23*U3456Star+S3*-Y45+a34*U456Star+S4*-Y5+a45*-sind(theta5)*cosd(alpha56)+S5*sind(alpha56)+a56*0+S6*0+a61*sind(theta6);
eq11 = S1*Z2345+a12*U23456+S2*Z345+a23*U3456+S3*Z45+a34*U456+S4*Z5+a45*U56+S5*cosd(alpha56)+a56*0+S6*1+a61*0;
[S3B,S4B,S5B] = solve(eq9 == 0,eq10 == 0,eq11 == 0,S3,S4,S5);


%% print
% fprintf("the first set of solution is:\n")
% fprintf("theta1A = %f, theta2A = %f, theta4A = %f\n",theta1A,theta2A,theta4A)
% fprintf("S3A = %f, S4A = %f, S5A = %f\n",double(S3A),double(S4A),double(S5A))
% fprintf("the second set of solution is:\n")
% fprintf("theta1B = %f, theta2B = %f, theta4B = %f\n",theta1B,theta2B,theta4B)
% fprintf("S3B = %f, S4B = %f, S5B = %f\n",double(S3B),double(S4B),double(S5B))
% fprintf("\n or \n\n")

%equivalent angles(turning the negative angles into positive ones)
if theta1A < 0
    theta1A = theta1A + 360;
end
if theta1B < 0
    theta1B = theta1B + 360;
end
if theta2A < 0
    theta2A = theta2A + 360;
end
if theta2B < 0
    theta2B = theta2B + 360;
end

if theta4A < 0
    theta4A = theta4A + 360;
end
if theta4B < 0
    theta4B = theta4B + 360;
end


fprintf("the first set of solution is:\n")
fprintf("theta1A = %f, theta2A = %f, theta4A = %f\n",theta1A,theta2A,theta4A)
fprintf("S3A = %f, S4A = %f, S5A = %f\n",double(S3A),double(S4A),double(S5A))
fprintf("the second set of solution is:\n")
fprintf("theta1B = %f, theta2B = %f, theta4B = %f\n",double(theta1B),double(theta2B),double(theta4B))
fprintf("S3B = %f, S4B = %f, S5B = %f\n",double(S3B),double(S4B),double(S5B))
