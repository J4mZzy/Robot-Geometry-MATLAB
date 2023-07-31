function v = unitVector(a)
% unit vector conversion 
mag = sqrt(a(1)^2+a(2)^2+a(3)^2);
v = [a(1)/mag,a(2)/mag,a(3)/mag]' ;
end