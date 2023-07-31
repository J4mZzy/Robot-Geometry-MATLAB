function q2 = quaternionInverse(q1)
%inverse of a quaternion
K = [q1(1) -q1(2) -q1(3) -q1(4)];
N = norm(q1);
q2 = K/N;
end