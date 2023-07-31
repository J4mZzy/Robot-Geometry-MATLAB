clc; clear; %clear work space and command window
%% problem 1
f1 = [8;3;-2];
f2 = [7;0;0];
f3 = [0;5;5];

p1 = [0;2;-2];
p2 = [4;0;8];
p3 = [6;1;-4];

m01 = cross(p1,f1); %moment 1 
m02 = cross(p2,f2); %moment 2
m03 = cross(p3,f3); %moment 3

%a dyname is defined as [f m0]= [f 0] + [0 m0] 
f_sum = f1 + f2 + f3; %force summation
m0_sum = m01 + m02 + m03; %moment summation

[ma,mt,magf,S,S0L,h] = dyname_to_wrench(f_sum,m0_sum);

%the wrench representation is [f m0] = [f mt] + [0 ma]
fprintf("Problem 1:\n")
fprintf("(a) the equivalent wrench is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),m0_sum(1),m0_sum(2),m0_sum(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

fprintf("(b) the magnitude of the force along the wrench is: %0.4f N\n",magf) 
fprintf("    line of action of the wrench is: ")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))
fprintf("    the pitch of the wrench is: %0.4f m\n\n",h)

%% problem 2
clear; %clear workspace
% a dyname is given as [f m0]= [f 0] + [0 m0]
%the wrench representation is [f m0] = [f mt] + [0 ma]
f1 = [3;2;4];
p1 = [0;-2;6];
m0 = [5;7;-4]; %couple given as moment

m01 = cross(p1,f1); %moment of the force
m0_sum = m0 + m01; %total moment
f_sum = f1;

[ma,mt,magf,S,S0L,h] = dyname_to_wrench(f_sum,m0_sum);

%the wrench representation is [f m0] = [f mt] + [0 ma]
fprintf("Problem 2:\n")
fprintf("(a) the equivalent wrench is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f1(1),f1(2),f1(3),m0_sum(1),m0_sum(2),m0_sum(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f1(1),f1(2),f1(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

fprintf("(b) the magnitude of the force along the wrench is: %0.4f N\n",magf) 
fprintf("    line of action of the wrench is: ")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))
fprintf("    the pitch of the wrench is: %0.4f m\n\n",h)

%% problem 3
clear; %clear workspace
%wrench parameters are given
S = [1,2,-4];
S0 = [0,4,2];
h = 1.5;
magf = 20;

[ma,mt,f,m0] = wrenchParam(S,S0,h,magf);

fprintf("Problem 3:\n")
fprintf("    the wrench coordinate is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f(1),f(2),f(3),m0(1),m0(2),m0(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f(1),f(2),f(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

%% problem 4
clear; %clear workspace
p1_XYZ = [0;0;0;1];
p2_XYZ = [4;0;0;1];
p3_XYZ = [2;2;0;1];
p4_xyz = [0;0;0;1];
p5_xyz = [2;0;0;1];
p6_xyz = [1;2;0;1];
p_translation = [0.5;0.5;5];

T1 = transformationMatrix(10,[1,0,0],p_translation); %translate, and rotate 10 degrees according to x-axis
T2 = transformationMatrix(15,[0,0,1],[0,0,0]); % rotate 15 dgrees about new z-axis
T = T1*T2; %xyz to XYZ

p4_XYZ = T*p4_xyz;
p5_XYZ = T*p5_xyz;
p6_XYZ = T*p6_xyz;

fprintf("Problem 4:\n")
fprintf("(a) p4 viewed in XYZ is:(%0.4f, %0.4f, %0.4f) unit(m) \n",p4_XYZ(1),p4_XYZ(2),p4_XYZ(3)) 
fprintf("    p5 viewed in XYZ is:(%0.4f, %0.4f, %0.4f) unit(m) \n",p5_XYZ(1),p5_XYZ(2),p5_XYZ(3)) 
fprintf("    p6 viewed in XYZ is:(%0.4f, %0.4f, %0.4f) unit(m) \n\n",p6_XYZ(1),p6_XYZ(2),p6_XYZ(3)) 

%S = r2 -r1  S0L = r1 x S
%Leg 1-4 1-5 2-5 2-6 3-6 3-4 are determined

S1_4 = p4_XYZ(1:3) - p1_XYZ(1:3);
S1_5 = p5_XYZ(1:3)- p1_XYZ(1:3);
S2_5 = p5_XYZ(1:3) - p2_XYZ(1:3);
S2_6 = p6_XYZ(1:3) - p2_XYZ(1:3);
S3_6 = p6_XYZ(1:3) - p3_XYZ(1:3);
S3_4 = p4_XYZ(1:3) - p3_XYZ(1:3);

S0L1_4 = cross(p1_XYZ(1:3),S1_4);
S0L1_5 = cross(p1_XYZ(1:3),S1_5);
S0L2_5 = cross(p2_XYZ(1:3),S2_5);
S0L2_6 = cross(p2_XYZ(1:3),S2_6);
S0L3_6 = cross(p3_XYZ(1:3),S3_6);
S0L3_4 = cross(p3_XYZ(1:3),S3_4);

fprintf("(b) the Plücker coordinates of Leg 1-4 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S1_4(1),S1_4(2),S1_4(3),S0L1_4(1),S0L1_4(2),S0L1_4(3));
fprintf("    the Plücker coordinates of Leg 1-5 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S1_5(1),S1_5(2),S1_5(3),S0L1_5(1),S0L1_5(2),S0L1_5(3));
fprintf("    the Plücker coordinates of Leg 2-5 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S2_5(1),S2_5(2),S2_5(3),S0L2_5(1),S0L2_5(2),S0L2_5(3));
fprintf("    the Plücker coordinates of Leg 2-6 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S2_6(1),S2_6(2),S2_6(3),S0L2_6(1),S0L2_6(2),S0L2_6(3));
fprintf("    the Plücker coordinates of Leg 3-6 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S3_6(1),S3_6(2),S3_6(3),S0L3_6(1),S0L3_6(2),S0L3_6(3));
fprintf("    the Plücker coordinates of Leg 3-4 is: unit(m) \n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n\n",S3_4(1),S3_4(2),S3_4(3),S0L3_4(1),S0L3_4(2),S0L3_4(3));

%static equalibirium, f_sum = 0,m0_sum = 0
f1_4 = 20;
f1_5 = 12;
f2_5 = 20;
f2_6 = 14;
f3_6 = 17;
f3_4 = 24;

S1_4_norm = norm(S1_4);
S1_5_norm = norm(S1_5);
S2_5_norm = norm(S2_5);
S2_6_norm = norm(S2_6);
S3_6_norm = norm(S3_6);
S3_4_norm = norm(S3_4);

%force sum and moment sum negated
f_sum = (f1_4*S1_4/S1_4_norm + f1_5*S1_5/S1_5_norm + f2_5*S2_5/S2_5_norm + f2_6*S2_6/S2_6_norm + f3_6*S3_6/S3_6_norm + f3_4*S3_4/S3_4_norm);
m0_sum = (f1_4*S0L1_4/S1_4_norm + f1_5*S0L1_5/S1_5_norm + f2_5*S0L2_5/S2_5_norm + f2_6*S0L2_6/S2_6_norm + f3_6*S0L3_6/S3_6_norm + f3_4*S0L3_4/S3_4_norm);

magf = norm(f_sum); %magnitude of force
S = f_sum/magf; %direction of force
ma = dot(m0_sum,S)*S;
mt = m0_sum - ma;

%the wrench representation is [f m0] = [f mt] + [0 ma]
fprintf("(c) the external wrench is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),m0_sum(1),m0_sum(2),m0_sum(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

% 6x1 wrench column matrix
w = [5;8;12;20;-15;20];
% 6x6 robot matrix
J1 = [S1_4/S1_4_norm;S0L1_4/S1_4_norm];
J2 = [S1_5/S1_5_norm;S0L1_5/S1_5_norm];
J3 = [S2_5/S2_5_norm;S0L2_5/S2_5_norm];
J4 = [S2_6/S2_6_norm;S0L2_6/S2_6_norm];
J5 = [S3_6/S3_6_norm;S0L3_6/S3_6_norm];
J6 = [S3_4/S3_4_norm;S0L3_4/S3_4_norm];

J = [J1 J2 J3 J4 J5 J6];

%JF = -w, solve for F
F = -J\w;
fprintf("(d) the force in Leg 1-4 is: %0.4f N\n",F(1)) 
fprintf("    the force in Leg 1-5 is: %0.4f N\n",F(2))
fprintf("    the force in Leg 2-5 is: %0.4f N\n",F(3))
fprintf("    the force in Leg 2-6 is: %0.4f N\n",F(4))
fprintf("    the force in Leg 3-6 is: %0.4f N\n",F(5))
fprintf("    the force in Leg 3-4 is: %0.4f N\n",F(6))
