function [R,s_sigma,c_sigma] = cylindroid(h1,h2,a12,alpha12)
%cylindroid
%alpha12 is given in degrees
R = sqrt((a12^2+(h2-h1)^2)/(4*sind(alpha12)^2));
s_sigma = (a12-(h2-h1)*cotd(alpha12))/(2*R);
c_sigma = ((h2-h1)+a12*cotd(alpha12))/(2*R);
end