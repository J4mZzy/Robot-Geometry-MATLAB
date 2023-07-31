function q3 = quaternionMultiplication2(q1,q2)
%Quaternion multiplication with 2 quaternions
%outputs a quaternion  
d1 = q1(1);
a1 = q1(2);
b1 = q1(3);
c1 = q1(4);
d2 = q2(1);
a2 = q2(2);
b2 = q2(3);
c2 = q2(4);

q3 = [d1*d2-a1*a2-b1*b2-c1*c2 d1*a2+d2*a1+b1*c2-b2*c1 d1*b2+d2*b1+a2*c1-a1*c2 d1*c2+d2*c1+a1*b2-a2*b1];
end