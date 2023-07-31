clc; clear; %clear work space and command window
%% problem 5
%  wrench 1 and wrench 2 are [5, −4, 2; 30, −15, 20] and[−6, 8, −2; −20, 10, 10]
f1 = [5, -4, 2];
f2 = [-6, 8, -2];
m01 = [30, -15, 20]; 
m02 = [-20, 10, 10];

f_sum = -(f1+f2);
m0_sum = -(m01+m02);

[ma,mt,magf,S,S0L,h] = dyname_to_wrench(f_sum,m0_sum);

%the wrench representation is [f m0] = [f mt] + [0 ma]
fprintf("Problem 5:\n")
fprintf("(a) the equivalent wrench is (N;Nm):\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),m0_sum(1),m0_sum(2),m0_sum(3))
fprintf(" = {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}",f_sum(1),f_sum(2),f_sum(3),mt(1),mt(2),mt(3))
fprintf(" + {0; %0.4f, %0.4f, %0.4f}\n\n",ma(1),ma(2),ma(3))

fprintf("(b) the magnitude of the force along the wrench is: %0.4f N\n",magf) 
fprintf("    line of action of the wrench is: ")
fprintf("{%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S(1),S(2),S(3),S0L(1),S0L(2),S0L(3))
fprintf("    the pitch of the wrench is: %0.4f m\n\n",h)

%% problem 6
clear; %clear workspace
% screw 1 and screw 2 are [1, 0, 0; 3, 6, −12]  [0,sqrt(2)/2 ,−sqrt(2)/2 ; 20, −15, 20].
S1 = [1, 0, 0];
S01 = [3, 6, -12];
S2 = [0,sqrt(2)/2 ,-sqrt(2)/2];
S02 = [20, -15, 20];

%pitch terms
h1 = dot(S1,S01);
h2 = dot(S2,S02);
% get unit line coordinates
S0L1 = S01 - h1*S1 ;
S0L2 = S02 - h2*S2 ;

[l,rE1,rE2] = perpendicular_line_to_two_lines(S1,S0L1,S2,S0L2);
[w1,p1]= point_of_intersection_two_lines(S1,S0L1,l(1,:),l(2,:));
[w2,p2]= point_of_intersection_two_lines(S2,S0L2,l(1,:),l(2,:));

fprintf("Problem 6:\n")
fprintf("(a) the coordinates of the point of intersection of the mutually perpendicular line with the first screw is:\n") 
fprintf("    (%0.4f, %0.4f, %0.4f)\n",p1(1),p1(2),p1(3))
fprintf("(b) the coordinates of the point of intersection of the mutually perpendicular line with the second screw is:\n") 
fprintf("    (%0.4f, %0.4f, %0.4f)\n",p2(1),p2(2),p2(3))
fprintf("(c)  the Plücker coordinates of the line that is mutually perpendicular to the lines of action of the two screws is:\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",l(1,1),l(1,2),l(1,3),l(2,1),l(2,2),l(2,3))

%translation is p1 from xyz to XYZ 
%z axis is along mutually perpendicular line (l1)
%x axis is along the first screw 

z = l(1,:)';
x = S1';
y = cross(z,x);

R = [x y z]; %rotation matrix from xyz to XYZ 
T1 = [R p1'; 0 0 0 1]; %transformation matrix from xyz to XYZ
T2 = inv(T1);  %transformation matrix from XYZ to xyz
[S1_xyz, S01_xyz] = transformationScrew(S1,S01,T2);
[S2_xyz, S02_xyz] = transformationScrew(S2,S02,T2);

fprintf("(d) the first screw in xyz coordinate system is:\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S1_xyz(1),S1_xyz(2),S1_xyz(3),S01_xyz(1),S01_xyz(2),S01_xyz(3))
fprintf("    the second screw in xyz coordinate system is:\n") 
fprintf("    {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n",S2_xyz(1),S2_xyz(2),S2_xyz(3),S02_xyz(1),S02_xyz(2),S02_xyz(3))

fprintf("(e) 1-5 parts\n") 

[mm, a12_1, alpha12_1, a12d_1, a12_2, alpha12_2, a12d_2] = mutual_moment(S1,S0L1,S2,S0L2);
%use a12_1 alpha12_1 a12d_1

[R,s_sigma,c_sigma] = cylindroid(h1,h2,a12d_1,alpha12_1);

h_max = h1 + R*(c_sigma+1);
h_min = h1 + R*(c_sigma-1);

fprintf("(i)  the minimum and maximum pitch values for the cylindroid are: %0.4f m and %0.4f m\n",h_min,h_max)

sigma = atan2d(s_sigma,c_sigma);
si1 = (180+sigma)/2; %when hmax
si2 = sigma/2;  %when hmin

ratio1 = sind(alpha12_1-si1)/sind(si1); %when max 
ratio2 = sind(alpha12_1-si2)/sind(si2); % when min
fprintf("(ii)  with minimum pitch resultant, the ratio f1/f2 is: %0.4f\n",ratio2)
fprintf("(iii) with maximum pitch resultant, the ratio f1/f2 is: %0.4f\n",ratio1)

r_max = R*(s_sigma+1);
r_min = R*(s_sigma-1); %will be used to find center

len = r_max-r_min;
%or len = 2*R;
fprintf("(iv) with length of the cylindroid is: %0.4f m\n",len)

rstar = R*sind(sigma);
%rstar is the same as the (r_max+r_min)/2

midpoint1 = rE1 + rstar*a12_1';
midpoint2 = T2*[midpoint1';1];

fprintf("(v)  coordinates of the center point of the cylindroid in the original XYZ coordinate system is:\n")
fprintf("    (%0.4f, %0.4f, %0.4f)\n",midpoint1(1),midpoint1(2),midpoint1(3))
fprintf("     coordinates of the center point of the cylindroid in the new xyz coordinate system is:\n")
fprintf("    (%0.4f, %0.4f, %0.4f)\n",midpoint2(1),midpoint2(2),midpoint2(3))
