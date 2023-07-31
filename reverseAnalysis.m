function angles = reverseAnalysis(S6,P_tool_F,P_tool_6,S6_F,a67_F)
%Reverse anaylisis of the Cincinnati Milacron T3-776
%solves angles phi1(theta1),theta2,thea3,theta4,theta5,theta6 in 8
%different cases

%% close the loop
[a71,S7,S1,alpha71,theta7,gamma] = closeTheLoop(P_tool_F,P_tool_6,S6_F,a67_F);

%% Robot parameters
a12 = 0;	
a23 = 44;	
a34 = 0;	
a45 = 0;	
a56 = 0;
a67 = 0;

alpha12 = 90;		
alpha23 = 0;	
alpha34 = 90;	
alpha45 = 61;
alpha56 = 61;
alpha67 = 90;

s12 = sind(alpha12);
c12 = cosd(alpha12);
s23 = sind(alpha23);
c23 = cosd(alpha23);
s34 = sind(alpha34);
c34 = cosd(alpha34);
s45 = sind(alpha45);
c45 = cosd(alpha45);
s56 = sind(alpha56);
c56 = cosd(alpha56);
s67 = sind(alpha67);
c67 = cosd(alpha67);
s71 = sind(alpha71);
c71 = cosd(alpha71);
s7 = sind(theta7);
c7 = cosd(theta7);

S2 = 0;
S3 = 0;
S4 = 55;
S5 = 0;

%% theta1 and phi1
%using solve trig to solve theta1 in forms of A*c1+B*s1+D=0
X7 = s67*s7;
Y7 = -(s71*c67+c71*s67*c7);
Z7 = c71*c67-s71*s67*c7;
A = S6*Y7-S7*s71;
B = S6*X7+a71;
D = S2;
[theta1a,theta1b,c] = solveTrig(A, B, D);  %A*c1+B*s1+D=0
if c == 0
    fprintf("invalid solution for theta1 !")
end

%phi1 a and b cases
phi1a = theta1a - gamma;
phi1b = theta1b - gamma;

%convert angles if theya are <0 or >360
if phi1a > 360
    phi1a = phi1a - 360;
elseif phi1a < 0
    phi1a = phi1a + 360;
end
if phi1b > 360
    phi1b = phi1b - 360;
elseif phi1b < 0
    phi1b = phi1b + 360;
end

%% theta3
%using s3 = (A3^2+B3^2-a23^2-S4^2)/(2*a23*S4) to find theta3

%theta3 a and b cases for theta1a
theta1 = theta1a;
s1 = sind(theta1);
c1 = cosd(theta1);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;

A3 = -S6*X71-S7*X1-a71*c1;
B3 = -S1+S6*Y71+S7*Y1;

s3 = (A3^2+B3^2-a23^2-S4^2)/(2*a23*S4);
theta3a = asind(s3);

%two cases that result in the same s3
if theta3a > 0
    theta3b = 180-theta3a;
elseif theta3a < 0
    theta3b = -(theta3a + 180);
end

%theta3 c and d cases for theta1b
theta1 = theta1b;
s1 = sind(theta1);
c1 = cosd(theta1);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);
X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;

A3 = -S6*X71-S7*X1-a71*c1;
B3 = -S1+S6*Y71+S7*Y1;

s3 = (A3^2+B3^2-a23^2-S4^2)/(2*a23*S4);
theta3c = asind(s3);
%two cases that result in the same s3
if theta3c > 0
    theta3d = 180-theta3a;
elseif theta3c < 0
    theta3d = -(theta3a + 180);
end

%% theta2
%theta2a case for theta1a and theta3a
theta1 = theta1a;
theta3 = theta3a;
s1 = sind(theta1);
c1 = cosd(theta1);
s3 = sind(theta3);
c3 = cosd(theta3);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;

A4 = -S6*X71-S7*X1-a71*c1;
B4 = -S1+S6*Y71+S7*Y1;

%in matrix from to solve 2 eqs with 2 unkowns
A = [S4*c3,a23+S4*s3;a23+S4*s3,-S4*c3];
B = [A4;B4];

x = A\B; 
s2 = x(1);
c2 = x(2);

theta2a = atan2d(s2, c2);

%theta2b case for theta1a and theta3b
theta1 = theta1a;
theta3 = theta3b;
s1 = sind(theta1);
c1 = cosd(theta1);
s3 = sind(theta3);
c3 = cosd(theta3);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
A4 = -S6*X71-S7*X1-a71*c1;
B4 = -S1+S6*Y71+S7*Y1;

%in matrix from to solve 2 eqs with 2 unkowns
A = [S4*c3,a23+S4*s3;a23+S4*s3,-S4*c3];
B = [A4;B4];

x = A\B; 
s2 = x(1);
c2 = x(2);

theta2b = atan2d(s2, c2);

%theta2c case for theta1b and theta3c
theta1 = theta1b;
theta3 = theta3c;
s1 = sind(theta1);
c1 = cosd(theta1);
s3 = sind(theta3);
c3 = cosd(theta3);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
A4 = -S6*X71-S7*X1-a71*c1;
B4 = -S1+S6*Y71+S7*Y1;

%in matrix from to solve 2 eqs with 2 unkowns
A = [S4*c3,a23+S4*s3;a23+S4*s3,-S4*c3];
B = [A4;B4];

x = A\B; 
s2 = x(1);
c2 = x(2);

theta2c = atan2d(s2, c2);

%theta2d case for theta1b and theta3d
theta1 = theta1b;
theta3 = theta3d;
s1 = sind(theta1);
c1 = cosd(theta1);
s3 = sind(theta3);
c3 = cosd(theta3);

X1 = s71*s1;
Y1 = -(s12*c71+c12*s71*c1);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
A4 = -S6*X71-S7*X1-a71*c1;
B4 = -S1+S6*Y71+S7*Y1;

%in matrix from to solve 2 eqs with 2 unkowns
A = [S4*c3,a23+S4*s3;a23+S4*s3,-S4*c3];
B = [A4;B4];

x = A\B; 
s2 = x(1);
c2 = x(2);

theta2d = atan2d(s2, c2);

%% theta5
%theta5a and b for theta1a theta2a theta3a
theta1 = theta1a;
theta2 = theta2a;
theta3 = theta3a;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)-c23*Z71;

Z7123 = s34*(X712*s3+Y712*c3)+c34*Z712;

theta5a = acosd((c56*c45-Z7123)/(s56*s45));
theta5b = -acosd((c56*c45-Z7123)/(s56*s45));

%theta5c and d for theta1a theta2b theta3b  
theta1 = theta1a;
theta2 = theta2b;
theta3 = theta3b;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)-c23*Z71;

Z7123 = s34*(X712*s3+Y712*c3)+c34*Z712;

theta5c = acosd((c56*c45-Z7123)/(s56*s45));
theta5d = -acosd((c56*c45-Z7123)/(s56*s45));

%theta5e and f for theta1b theta2c theta3c
theta1 = theta1b;
theta2 = theta2c;
theta3 = theta3c;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)-c23*Z71;

Z7123 = s34*(X712*s3+Y712*c3)+c34*Z712;

theta5e = acosd((c56*c45-Z7123)/(s56*s45));
theta5f = -acosd((c56*c45-Z7123)/(s56*s45));

%theta5g and h for theta1b theta2d theta3d
theta1 = theta1b;
theta2 = theta2d;
theta3 = theta3d;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)-c23*Z71;

Z7123 = s34*(X712*s3+Y712*c3)+c34*Z712;

theta5g = acosd((c56*c45-Z7123)/(s56*s45));
theta5h = -acosd((c56*c45-Z7123)/(s56*s45));

%% theta4
%theta4a for theta1a 2a 3a 5a
theta1 = theta1a;
theta2 = theta2a;
theta3 = theta3a;
theta5 = theta5a;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4a = atan2d(s4, c4);

%theta4b for theta1a 2a 3a 5b
theta1 = theta1a;
theta2 = theta2a;
theta3 = theta3a;
theta5 = theta5b;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4b = atan2d(s4, c4);

%theta4c for theta1a 2b 3b 5c
theta1 = theta1a;
theta2 = theta2b;
theta3 = theta3b;
theta5 = theta5c;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4c = atan2d(s4, c4);

%theta4d for theta1a 2b 3b 5d
theta1 = theta1a;
theta2 = theta2b;
theta3 = theta3b;
theta5 = theta5d;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

%in matrix from to solve 2 eqs with 2 unkowns
X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4d = atan2d(s4, c4);

%theta4e for theta1b 2c 3c 5e
theta1 = theta1b;
theta2 = theta2c;
theta3 = theta3c;
theta5 = theta5e;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4e = atan2d(s4, c4);

%theta4f for theta1b 2c 3c 5f
theta1 = theta1b;
theta2 = theta2c;
theta3 = theta3c;
theta5 = theta5f;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4f = atan2d(s4, c4);

%theta4g for theta1b 2d 3d 5g
theta1 = theta1b;
theta2 = theta2d;
theta3 = theta3d;
theta5 = theta5g;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4g = atan2d(s4, c4);

%theta4h for theta1b 2d 3d 5h
theta1 = theta1b;
theta2 = theta2d;
theta3 = theta3d;
theta5 = theta5h;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s5 = sind(theta5);
c5 = cosd(theta5);

X71 = X7*c1-Y7*s1;
Y71 = c12*(X7*s1+Y7*c1)-s12*Z7;
Z71 = s12*(X7*s1+Y7*c1)+c12*Z7;

X712 = X71*c2-Y71*s2;
Y712 = c23*(X71*s2+ Y71*c2)-s23*Z71;
Z712 = s23*(X71*s2+ Y71*c2)+c23*Z71;

X7123 = X712*c3-Y712*s3;
Y7123 = c34*(X712*s3+Y712*c3)-s34*Z712;

X_5 = s56*s5;
Y_5 = -(s45*c56+c45*s56*c5);

%in matrix from to solve 2 eqs with 2 unkowns
A = [-Y_5,X_5;X_5,Y_5];
B = [X7123;-Y7123];

x = A\B; 
s4 = x(1);
c4 = x(2);

theta4h = atan2d(s4, c4);

%% theta6 
%theta6a for theta 1a 2a 3a 4a 5a
theta1 = theta1a;
theta3 = theta3a;
theta2 = theta2a;
theta4 = theta4a;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6a = atan2d(X43217, Y43217);

%theta6b for theta 1a 2a 3a 4b 5b
theta1 = theta1a;
theta3 = theta3a;
theta2 = theta2a;
theta4 = theta4b;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6b = atan2d(X43217, Y43217);

%theta6c for theta 1a 2b 3b 4c 5c
theta1 = theta1a;
theta3 = theta3b;
theta2 = theta2b;
theta4 = theta4c;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6c = atan2d(X43217, Y43217);

%theta6d for theta 1a 2b 3b 4d 5d
theta1 = theta1a;
theta3 = theta3b;
theta2 = theta2b;
theta4 = theta4d;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6d = atan2d(X43217, Y43217);

%theta6e for theta 1b 2c 3c 4e 5e
theta1 = theta1b;
theta3 = theta3c;
theta2 = theta2c;
theta4 = theta4e;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6e = atan2d(X43217, Y43217);

%theta6f for theta 1b 2c 3c 4f 5f
theta1 = theta1b;
theta3 = theta3c;
theta2 = theta2c;
theta4 = theta4f;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6f = atan2d(X43217, Y43217);

%theta6g for theta 1b 2d 3d 4g 5g
theta1 = theta1b;
theta3 = theta3d;
theta2 = theta2d;
theta4 = theta4g;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6g = atan2d(X43217, Y43217);

%theta6h for theta 1b 2d 3d 4h 5h
theta1 = theta1b;
theta3 = theta3d;
theta2 = theta2d;
theta4 = theta4h;
s1 = sind(theta1);
c1 = cosd(theta1);
s2 = sind(theta2);
c2 = cosd(theta2);
s3 = sind(theta3);
c3 = cosd(theta3);
s4 = sind(theta4);
c4 = cosd(theta4);

X_4 = s45*s4;
Y_4 = -(s34*c45+c34*s45*c4);
Z_4 = c34*c45-s34*s45*c4;

X43 = X_4*c3-Y_4*s3;
Y43 = c23*(X_4*s3+Y_4*c3)-s23*Z_4;
Z43 = s23*(X_4*s3+Y_4*c3)+c23*Z_4;

X432 = X43*c2-Y43*s2;
Y432 = c12*(X43*s2+Y43*c2)-s12*Z43;
Z432 = s12*(X43*s2+Y43*c2)+c12*Z43;

X4321 = X432*c1-Y432*s1;
Y4321 = c71*(X432*s1+Y432*c1)-s71*Z432;
Z4321 = s71*(X432*s1+Y432*c1)+c71*Z432;

X43217 = X4321*c7-Y4321*s7;
Y43217 = c67*(X4321*s7+Y4321*c7)-s67*Z4321;

theta6h = atan2d(X43217, Y43217);

%% output
angles = [phi1a theta2a theta3a theta4a theta5a theta6a;
          phi1a theta2a theta3a theta4b theta5b theta6b;
          phi1a theta2b theta3b theta4c theta5c theta6c;
          phi1a theta2b theta3b theta4d theta5d theta6d;
          phi1b theta2c theta3c theta4e theta5e theta6e;
          phi1b theta2c theta3c theta4f theta5f theta6f;
          phi1b theta2d theta3d theta4g theta5g theta6g;
          phi1b theta2d theta3d theta4h theta5h theta6h];

end