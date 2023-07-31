clc; clear;
t = 0:0.01:10; %time 
m = 10;
g = 9.8;
c = 10;
v0 = 30;
vter = sqrt(m*g/c);
v = vter*tand(-g*t/vter+atand(v0/vter));
plot(t,v)