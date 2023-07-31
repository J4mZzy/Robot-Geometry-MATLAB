clc; clear;
%Problem 1
fprintf("Problem 1\n")
d1 = norm(point_closest_to_origin_plane(1,[-3,4,12]));
fprintf("The distance is %0.4f\n\n",d1)


%Problem 2
fprintf("Problem 2\n")
d2 = norm(point_closest_to_origin_line([-4,12,3],[-24,-6,-8]));
fprintf("Part a: The distance is %0.4f\n",d2)

d3 = norm(point_closest_to_origin_line([3,4,-12],[16,27,13]));
fprintf("Part b: The distance is %0.4f\n\n",d3)

%Problem 3
fprintf("Problem 3\n")
l = line_of_intersection(1,1,[-4,12,3],[3,4,-12]);
S3 = l(1,:);
S0L3 = l(2,:);

fprintf("The line is expressed as {%0.4f, %0.4f, %0.4f; %0.4f, %0.4f, %0.4f}\n\n",S3(1),S3(2),S3(3),S0L3(1),S0L3(2),S0L3(3))

%Problem 6
fprintf("Problem 6\n")
r0 = point_of_intersection_line_and_plane([3,4,-12],[16,27,13],1,[4,1,5]);
fprintf("The point of intersection is (%0.4f, %0.4f, %0.4f)\n", r0(1),r0(2),r0(3))