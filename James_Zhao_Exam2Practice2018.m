%%Exam2 2018 problem2
%finding prependicular distance between a point and Z axis (close the loop)
clc;clear;

%close the loop (only solving for a71)
P = [10,15,6]'; %point 6 origin in fixed

S1_f = [0,0,1]'; %S1 vector
S7_f = unitVector([-2,2,1]');  %S7 vector

a71_f = unitVector(cross(S7_f,S1_f));
s71 = dot(cross(S7_f,S1_f),a71_f);
   
a71 = dot(cross(P,S1_f),S7_f)/s71; %a71

disp(a71)