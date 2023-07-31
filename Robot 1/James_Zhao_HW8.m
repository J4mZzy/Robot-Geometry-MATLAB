clc;clear;

S1 = 6.0;
S2 = 4.5;
S4 = 7.5;
S6 = 3.9;

alpha12 = 47.5;		
alpha23 = 221.0;	
alpha34 = 115.0;	
alpha45 = 38.5;		
alpha56 = 295.0;		
alpha61 = 45.0;	

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
s61 = sind(alpha61);
c61 = cosd(alpha61);

a12 = 5.5;	
a23 = 3.6;	
a34 = 7.2;	
a45 = 2.8;	
a56 = 3.8;	
a61 = 6.2;

theta3 = 90;
theta6 = 220;

s3 = sind(theta3);
c3 = cosd(theta3);
s6 = sind(theta6);
c6 = cosd(theta6);

X6 = s56*s6;
Y6 = -(s61*c56 +c61*s56*c6);
Z6 = c61*c56 - s61*s56*c6;

A1 = s34 * (Y6 * c12 * c23 * c3 + X6 * s3) + c34 * s23 * c12 * Y6;
B1 = s34 * (X6 * c12 * c23 * c3 - Y6 * s3) + c34 * s23 * c12 * X6;
D1 = -s12 * Z6 * (c23 * c3 * s34 + c34 * s23);
E1 = s34 * (c23 * X6 * c3 - c12 * Y6 * s3) + c34 * s23 * X6;
F1 = s34 * (-c12 * X6 * s3 - c23 * Y6 * c3) - c34 * s23 * Y6;
G1 = Z6 * s12 * s3 * s34;
H1 = -Y6 * c3 * s12 * s23 * s34 + Y6 * c23 * c34 * s12;
I1 = -X6 * c3 * s12 * s23 * s34 + X6 * c23 * c34 * s12;
J1 = -Z6 * (c3 * s23 * s34 - c23 * c34) * c12 - c45;

A2 = S6 * s56 * c12 * c61 * s23 * s6 + S1 * X6 * c12 * s23 + S2 * s23 * X6 + a56 * (-c12 * c56 * c6 * c61 * s23 + c12 * s23 * s56 * s61) + a61 * (c12 * c6 * s23 * s56 * s61 - c12 * c56 * c61 * s23) - a12 * s23 * s12 * Y6 + a23 * c12 * Y6 * c23 - S4 * s34 * (-Y6 * c12 * c23 * s3 + X6 * c3) + a34 * (Y6 * c12 * c23 * c3 + X6 * s3) - a45 * s23 * c12 * Y6 * c45 / s45;
B2 = S6 * s56 * c12 * s23 * c6 - S1 * Y6 * c12 * s23 - S2 * s23 * Y6 + a56 * c56 * c12 * s23 * s6 - a12 * s23 * s12 * X6 + a23 * c12 * X6 * c23 - S4 * s34 * (-X6 * c12 * c23 * s3 - Y6 * c3) + a34 * (X6 * c12 * c23 * c3 - Y6 * s3) - a45 * s23 * c12 * X6 * c45 / s45;
D2 = (((((-S6 * s6 * s61 + c61 * (a61 * c6 + a56)) * s56 + c56 * s61 * (a56 * c6 + a61)) * s23 - c23 * Z6 * (S4 * s3 * s34 + a34 * c3 + a23)) * s12 - c12 * s23 * Z6 * a12) * s45 + Z6 * a45 * c45 * s12 * s23) / s45;
E2 = S6 * s56 * c6 * s23 - S1 * s23 * Y6 - S2 * s23 * c12 * Y6 + a56 * c56 * s23 * s6 + a23 * c23 * X6 - S4 * s34 * (-X6 * c23 * s3 - Y6 * c12 * c3) + a34 * (X6 * c23 * c3 - Y6 * c12 * s3) - a45 * s23 * X6 * c45 / s45;
F2 = -S6 * s56 * c61 * s23 * s6 - S1 * s23 * X6 - S2 * s23 * c12 * X6 + a56 * (c56 * c6 * c61 * s23 - s23 * s56 * s61) + a61 * (-c6 * s23 * s56 * s61 + c56 * c61 * s23) - a23 * c23 * Y6 - S4 * s34 * (-X6 * c12 * c3 + Y6 * c23 * s3) + a34 * (-X6 * c12 * s3 - Y6 * c23 * c3) + a45 * s23 * Y6 * c45 / s45;
G2 = Z6 * s12 * (-S4 * c3 * s34 + S2 * s23 + a34 * s3);
H2 = S6 * s56 * c23 * c61 * s12 * s6 + S1 * X6 * c23 * s12 + a56 * (-c23 * c56 * c6 * c61 * s12 + c23 * s12 * s56 * s61) + a61 * (c23 * c6 * s12 * s56 * s61 - c23 * c56 * c61 * s12) + a12 * c12 * Y6 * c23 - a23 * s23 * s12 * Y6 - S4 * s34 * s23 * s12 * Y6 * s3 - a34 * s23 * s12 * Y6 * c3 - a45 * c23 * s12 * Y6 * c45 / s45;
I2 = S6 * s56 * c23 * s12 * c6 - S1 * Y6 * c23 * s12 + a56 * c56 * c23 * s12 * s6 + a12 * c12 * X6 * c23 - a23 * s23 * s12 * X6 - S4 * s34 * s23 * s12 * X6 * s3 - a34 * s23 * s12 * X6 * c3 - a45 * c23 * s12 * X6 * c45 / s45;
J2 = (((((S6 * s6 * s61 - c61 * (a61 * c6 + a56)) * s56 - c56 * s61 * (a56 * c6 + a61)) * c23 - s23 * Z6 * (S4 * s3 * s34 + a34 * c3 + a23)) * c12 - c23 * s12 * Z6 * a12) * s45 - a45 * (Z6 * c12 * c23 * c45 - c34)) / s45;

a1 = A1 - D1 - H1 + J1;
b1 = 2*(I1-B1);
d1 = -A1 - D1 + H1 + J1;
e1 = 2*(G1-E1);
f1 = 4*F1;
g1 = 2*(G1+E1);
h1 = -A1 + D1 - H1 + J1;
i1 = 2*(I1+B1);
j1 = A1 + D1 + H1 + J1;

a2 = A2 - D2 - H2 + J2;
b2 = 2*(I2-B2);
d2 = -A2 - D2 + H2 + J2;
e2 = 2*(G2-E2);
f2 = 4*F2;
g2 = 2*(G2+E2);
h2 = -A2 + D2 - H2 + J2;
i2 = 2*(I2+B2);
j2 = A2 + D2 + H2 + J2;

[x1,x2] = solve_bi_quadratics(a1, b1, d1, e1, f1, g1, h1, i1, j1, a2, b2, d2, e2, f2, g2, h2, i2, j2);


for i=1:8
  fprintf("solution set %d",i)
  if imag(x1(i)) ~= 0 || imag(x2(i)) ~= 0
    fprintf("  (not a real solution)")
  end
  theta1(i) = atan2d(2*real(x1(i))/(1+real(x1(i))^2),(1-real(x1(i))^2)/(1+real(x1(i))^2));
  theta2(i) = atan2d(2*real(x2(i))/(1+real(x2(i))^2),(1-real(x2(i))^2)/(1+real(x2(i))^2));
  fprintf("\ntheta1 is: %0.4f\n", theta1(i))
  fprintf("theta2 is: %0.4f\n", theta2(i))
  
  s1 = sind(theta1(i));
  c1 = cosd(theta1(i));
  s2 = sind(theta2(i));
  c2 = cosd(theta2(i));

  %theta4 can be derived by foundametal law that contains 12346
  %X4321 = s56*s6 Y4321 = s56*c6
  syms s4 c4

  X_4 = s45*s4;
  Y_4 = -(s34*c45 +c34*s45*c4);
  Z_4 = c34*c45 - s34*s45*c4;

  X43 = X_4*c3-Y_4*s3;
  Y43 = c23*(X_4*s3 + Y_4*c3) - s23 *Z_4;
  Z43 = s23*(X_4*s3 + Y_4*c3) + c23 *Z_4;

  X432 = X43*c2-Y43*s2;
  Y432 = c12*(X43 *s2 + Y43 *c2) - s12*Z43;
  Z432 = s12*(X43 *s2 + Y43 *c2) + c12*Z43;

  X4321 = X432*c1-Y432*s1;
  Y4321 = c61*(X432*s1 + Y432*c1) - s61*Z432;

  eq1 = X4321 - s56*s6;
  eq2 = Y4321 - s56*c6;

  [s4,c4] = solve(eq1 == 0,eq2 == 0,s4,c4);

  theta4(i) = double(atan2d(s4,c4));

  s4 = sind(theta4(i));
  c4 = cosd(theta4(i));

  fprintf("theta4 is: %0.4f\n", theta4(i))

  %theta5 can be derived by fundamental law that contains 12345
  % X1234 = s56*s5 Y1234 = s56*c5
  syms s5 c5
  
  X1 = s61*s1;
  Y1 = -(s12*c61+c12*s61*c1);
  Z1 = c12*c61-s12*s61*c1;

  X12 = X1*c2-Y1*s2;
  Y12 = c23*(X1*s2+Y1*c2)-s23*Z1;
  Z12 = s23*(X1*s2+Y1*c2)+c23*Z1;


  X123 = X12*c3-Y12*s3;
  Y123 = c34*(X12*s3+Y12*c3)-s34*Z12;
  Z123 = s34*(X12*s3+Y12*c3)+c34*Z12;

  X1234 = X123*c4-Y123*s4;
  Y1234 = c45*(X123*s4+Y123*c4)-s45*Z123;  

  eq3 = X1234 - s56*s5;
  eq4 = Y1234 - s56*c5;
  
  [s5,c5] = solve(eq3 == 0,eq4 == 0,s5,c5);
  theta5(i) = double(atan2d(s5,c5));

  s5 = sind(theta5(i));
  c5 = cosd(theta5(i));

  fprintf("theta5 is: %0.4f\n", theta5(i))

  %2 link lengths S3,S5
  syms S3 S5
  %vector S1
  X2 = s12*s2;
  Y2 = -(s23*c12+c23*s12*c2);
  Z2 = c23*c12-s23*s12*c2;

  X23 = X2*c3-Y2*s3;
  Y23 = c34*(X2*s3+Y2*c3)-s34*Z2;
  Z23 = s34*(X2*s3+Y2*c3)+c34*Z2;

  X234 = X23*c4-Y23*s4;
  Y234 = c45*(X23*s4+Y23*c4)-s45*Z23;
  Z234 = s45*(X23*s4+Y23*c4)+c45*Z23;

  X2345 = X234*c5-Y234*s5;
  Y2345 = c56*(X234*s5+Y234*c5)-s56*Z234;
  Z2345 = s56*(X234*s5+Y234*c5)+c56*Z234;

  %vector a12
  U23 = s2*s23;
  V23 = -(s3*c2+c3*s2*c23);
  W23 = c3*c2-s3*s2*c23;

  U234 = U23*c34-V23*s34;
  V234 = c4*(U23*s34+V23*c34)-s4*W23;
  W234 = s4*(U23*s34+V23*c34)+c4*W23;

  U2345 = U234*c45-V234*s45;
  V2345 = c5*(U234*s45+V234*c45)-s5*W234;

  W2345 = s5*(U234*s45+V234*c45)+c5*W234;
  U23456Star = U2345*s56+V2345*c56;
  U23456 = U2345*c56-V2345*s56;

  %vector S2
  X3 = s23*s3;
  Y3 = -(s34*c23+c34*s23*c3);
  Z3 = c34*c23-s34*s23*c3;

  X34 = X3*c4-Y3*s4;
  Y34 = c45*(X3*s4+Y3*c4)-s45*Z3;
  Z34 = s45*(X3*s4+Y3*c4)+c45*Z3;

  X345 = X34*c5-Y34*s5;
  Y345 = c56*(X34*s5+Y34*c5)-s56*Z34;
  Z345 = s56*(X34*s5+Y34*c5)+c56*Z34;

  %vector a23
  U34 = s3*s34;
  V34 = -(s4*c3+c4*s3*c34);
  W34 = c4*c3-s4*s3*c34;

  U345 = U34*c45-V34*s45;
  V345 = c5*(U34*s45+V34*c45)-s5*W34;

  W345 = s5*(U34*s45+V34*c45)+c5*W34;
  U3456Star = U345*s56+V345*c56;
  U3456 = U345*c56-V345*s56;

  %vector S3
  X4 = s34*s4;
  Y4 = -(s45*c34+c45*s34*c4);
  Z4 = c45*c34-s45*s34*c4;

  X45 = X4*c5-Y4*s5;
  Y45 = c56*(X4*s5+Y4*c5)-s56*Z4;
  Z45 = s56*(X4*s5+Y4*c5)+c56*Z4;

  %vector a34
  U45 = s4*s45;
  V45 = -(s5*c4+c5*s4*c45);

  W45 = c5*c4-s5*s4*c45;
  U456Star = U45*s56+V45*c56;
  U456= U45*c56-V45*s56;

  %vector S4
  X5 = s45*s5;
  Y5 = -(s56*c45+c56*s45*c5);
  Z5 = c56*c45-s56*s45*c5;

  %vector a45
  %only U56 needs to be defined
  U56 = s5*s56;

  %solve (set 8)
  eq5 = S1*X2345+a12*W2345+S2*X345+a23*W345+S3*X45+a34*W45+S4*X5+a45*c5+S5*0+a56*1+S6*0+a61*c6;
  eq6 = S1*-Y2345+a12*U23456Star+S2*-Y345+a23*U3456Star+S3*-Y45+a34*U456Star+S4*-Y5+a45*-s5*c56+S5*s56+a56*0+S6*0+a61*s6;
  eq7 = S1*Z2345+a12*U23456+S2*Z345+a23*U3456+S3*Z45+a34*U456+S4*Z5+a45*U56+S5*c56+a56*0+S6*1+a61*0;
  [S3,S5] = solve(eq5 == 0,eq6 == 0,S3,S5);
  S3(i) = double(S3);
  S5(i) = double(S5);

  fprintf("S3 is: %0.4f\n", S3(i))
  fprintf("S5 is: %0.4f\n", S5(i))

  fprintf("\n")
end
