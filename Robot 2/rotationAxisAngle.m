function [theta,m] = rotationAxisAngle(R)
%find the axis and the angle of the rotation from the rotation matrix
%(theta in radians)
theta = acosd((R(1,1)+R(2,2)+R(3,3)-1)/2);
m = [(R(3,2)-R(2,3))/2/sind(theta),(R(1,3)-R(3,1))/2/sind(theta),(R(2,1)-R(1,2))/2/sind(theta)]';
end