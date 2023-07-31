function r2 = quaternionMultiplication3(q,r1)
%Quaternion operater with 2 quaternions and a vector
%r' = q(r)q^-1
%outputs a vector 
c = q(1);
s = norm(q(2:4));
sx = q(2)/s;
sy = q(3)/s;
sz = q(4)/s;
rx = r1(1);
ry = r1(2);
rz = r1(3);

r2 = [s^2*(sx*(2*sx*rx+2*sy*ry+2*sz*rz)-rx) + 2*s*c*(sy*rz-ry*sz)+c^2*rx;
      s^2*(sy*(2*sx*rx+2*sy*ry+2*sz*rz)-ry) + 2*s*c*(sz*rx-rz*sx)+c^2*ry;                                       
      s^2*(sz*(2*sx*rx+2*sy*ry+2*sz*rz)-rz) + 2*s*c*(sx*ry-rx*sy)+c^2*rz];                                        
end