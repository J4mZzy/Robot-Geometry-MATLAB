function T = transformationMatrixForward(theta,alpha,a,S)
%transformation matrix for forward analysis

s = sin(theta/180*pi); %sin for theta
c = cos(theta/180*pi); %cos for theta
s1 = sin(alpha/180*pi); %sin for alpha
c1 = cos(alpha/180*pi); %cos for alpha

T = [c, -s, 0, a;
     s*c1, c*c1, -s1, -s1*S;
     s*s1, c*s1, c1, c1*S;
     0, 0, 0, 1]; 
end
