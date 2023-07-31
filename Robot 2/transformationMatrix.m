function T = transformationMatrix(theta,m,P)
%transformation matrix rotating in a degree of theta with axis m, and with
%a translation of P (the origin expressed in the other coordinate system)
%m = [1,0,0] for rotating around x, [0,1,0] for y, [0,0,1] for z
%m = [0,0,0] for pure translation

v = 1 - cos(theta/180*pi); 
s = sin(theta/180*pi);
c = cos(theta/180*pi);

T = [m(1)^2*v+c, m(1)*m(2)*v-m(3)*s, m(1)*m(3)*v+m(2)*s, P(1);
     m(1)*m(2)*v+m(3)*s, m(2)^2*v+c, m(2)*m(3)*v-m(1)*s, P(2);
     m(1)*m(3)*v-m(2)*s, m(2)*m(3)*v+m(1)*s, m(3)^2*v+c, P(3);
     0, 0, 0, 1]; 
end