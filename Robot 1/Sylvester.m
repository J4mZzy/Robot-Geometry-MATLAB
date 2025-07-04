function [x1,x2] = Sylvester(a1, b1, d1, e1, f1, g1, h1, i1, j1, a2, b2, d2, e2, f2, g2, h2, i2, j2)
%solve_bi_quadratics Solve 2 equations in 2 unknowns
%   x2^2 (ai x1^2 + bi x1 + di) + x2 (ei x1^2 + fi x1 + gi) + (hi x1^2 + ii
%   x1 + ji) = 0, i=1,2
%   Returns 8 values for x1 & x2

% test case [x1,x2] = Sylvester(2.2,7.1,11.6,2.7,-1.4,-7.7,5.9,2.7,1.0,6.3,-1.7,8.6,-2.7,-4.4,6.6,2.5,2.8,-3.1)

% Sylvester's method used to get 8th order polynomial in x1.

C8 = -a1 * a1 * h2 * h2 + 2 * a1 * a2 * h1 * h2 + a1 * e1 * e2 * h2 - a1 * e2 * e2 * h1... 
     - a2 * a2 * h1 * h1 - a2 * e1 * e1 * h2 + a2 * e1 * e2 * h1;

C7 = -2 * a1 * a1 * h2 * i2 + 2 * a1 * a2 * h1 * i2 + 2 * a1 * a2 * h2 * i1...
     - 2 * a1 * b1 * h2 * h2 + 2 * a1 * b2 * h1 * h2 + a1 * e1 * e2 * i2 + a1 * e1 * f2 * h2...
	 - a1 * e2 * e2 * i1 + a1 * e2 * f1 * h2 - 2 * a1 * e2 * f2 * h1 - 2 * a2 * a2 * h1 * i1...
	 + 2 * a2 * b1 * h1 * h2 - 2 * a2 * b2 * h1 * h1 - a2 * e1 * e1 * i2 + a2 * e1 * e2 * i1...
	 - 2 * a2 * e1 * f1 * h2 + a2 * e1 * f2 * h1 + a2 * e2 * f1 * h1 + b1 * e1 * e2 * h2...
	 - b1 * e2 * e2 * h1 - b2 * e1 * e1 * h2 + b2 * e1 * e2 * h1;

C6 = -2 * a1 * a1 * h2 * j2 - a1 * a1 * i2 * i2 + 2 * a1 * a2 * h1 * j2...
    + 2 * a1 * a2 * h2 * j1 + 2 * a1 * a2 * i1 * i2 - 4 * a1 * b1 * h2 * i2...
	+ 2 * a1 * b2 * h1 * i2 + 2 * a1 * b2 * h2 * i1 - 2 * a1 * d1 * h2 * h2...
	+ 2 * a1 * d2 * h1 * h2 + a1 * e1 * e2 * j2 + a1 * e1 * f2 * i2 + a1 * e1 * g2 * h2...
	- a1 * e2 * e2 * j1 + a1 * e2 * f1 * i2 - 2 * a1 * e2 * f2 * i1 + a1 * e2 * g1 * h2...
	- 2 * a1 * e2 * g2 * h1 + a1 * f1 * f2 * h2 - a1 * f2 * f2 * h1 - 2 * a2 * a2 * h1 * j1...
	- a2 * a2 * i1 * i1 + 2 * a2 * b1 * h1 * i2 + 2 * a2 * b1 * h2 * i1...
	- 4 * a2 * b2 * h1 * i1 + 2 * a2 * d1 * h1 * h2 - 2 * a2 * d2 * h1 * h1...
	- a2 * e1 * e1 * j2 + a2 * e1 * e2 * j1 - 2 * a2 * e1 * f1 * i2 + a2 * e1 * f2 * i1...
	- 2 * a2 * e1 * g1 * h2 + a2 * e1 * g2 * h1 + a2 * e2 * f1 * i1 + a2 * e2 * g1 * h1...
	- a2 * f1 * f1 * h2 + a2 * f1 * f2 * h1 - b1 * b1 * h2 * h2 + 2 * b1 * b2 * h1 * h2...
	+ b1 * e1 * e2 * i2 + b1 * e1 * f2 * h2 - b1 * e2 * e2 * i1 + b1 * e2 * f1 * h2...
	- 2 * b1 * e2 * f2 * h1 - b2 * b2 * h1 * h1 - b2 * e1 * e1 * i2 + b2 * e1 * e2 * i1...
	- 2 * b2 * e1 * f1 * h2 + b2 * e1 * f2 * h1 + b2 * e2 * f1 * h1 + d1 * e1 * e2 * h2...
	- d1 * e2 * e2 * h1 - d2 * e1 * e1 * h2 + d2 * e1 * e2 * h1;

C5 = -2 * a1 * a1 * i2 * j2 + 2 * a1 * a2 * i1 * j2 + 2 * a1 * a2 * i2 * j1...
    - 4 * a1 * b1 * h2 * j2 - 2 * a1 * b1 * i2 * i2 + 2 * a1 * b2 * h1 * j2...
	+ 2 * a1 * b2 * h2 * j1 + 2 * a1 * b2 * i1 * i2 - 4 * a1 * d1 * h2 * i2...
	+ 2 * a1 * d2 * h1 * i2 + 2 * a1 * d2 * h2 * i1 + a1 * e1 * f2 * j2 + a1 * e1 * g2 * i2...
	+ a1 * e2 * f1 * j2 - 2 * a1 * e2 * f2 * j1 + a1 * e2 * g1 * i2 - 2 * a1 * e2 * g2 * i1...
	+ a1 * f1 * f2 * i2 + a1 * f1 * g2 * h2 - a1 * f2 * f2 * i1 + a1 * f2 * g1 * h2...
	- 2 * a1 * f2 * g2 * h1 - 2 * a2 * a2 * i1 * j1 + 2 * a2 * b1 * h1 * j2...
	+ 2 * a2 * b1 * h2 * j1 + 2 * a2 * b1 * i1 * i2 - 4 * a2 * b2 * h1 * j1...
	- 2 * a2 * b2 * i1 * i1 + 2 * a2 * d1 * h1 * i2 + 2 * a2 * d1 * h2 * i1...
	- 4 * a2 * d2 * h1 * i1 - 2 * a2 * e1 * f1 * j2 + a2 * e1 * f2 * j1...
	- 2 * a2 * e1 * g1 * i2 + a2 * e1 * g2 * i1 + a2 * e2 * f1 * j1 + a2 * e2 * g1 * i1...
	- a2 * f1 * f1 * i2 + a2 * f1 * f2 * i1 - 2 * a2 * f1 * g1 * h2 + a2 * f1 * g2 * h1...
	+ a2 * f2 * g1 * h1 - 2 * b1 * b1 * h2 * i2 + 2 * b1 * b2 * h1 * i2...
	+ 2 * b1 * b2 * h2 * i1 - 2 * b1 * d1 * h2 * h2 + 2 * b1 * d2 * h1 * h2...
	+ b1 * e1 * e2 * j2 + b1 * e1 * f2 * i2 + b1 * e1 * g2 * h2 - b1 * e2 * e2 * j1...
	+ b1 * e2 * f1 * i2 - 2 * b1 * e2 * f2 * i1 + b1 * e2 * g1 * h2 - 2 * b1 * e2 * g2 * h1...
	+ b1 * f1 * f2 * h2 - b1 * f2 * f2 * h1 - 2 * b2 * b2 * h1 * i1 + 2 * b2 * d1 * h1 * h2...
	- 2 * b2 * d2 * h1 * h1 - b2 * e1 * e1 * j2 + b2 * e1 * e2 * j1 - 2 * b2 * e1 * f1 * i2...
	+ b2 * e1 * f2 * i1 - 2 * b2 * e1 * g1 * h2 + b2 * e1 * g2 * h1 + b2 * e2 * f1 * i1...
	+ b2 * e2 * g1 * h1 - b2 * f1 * f1 * h2 + b2 * f1 * f2 * h1 + d1 * e1 * e2 * i2...
	+ d1 * e1 * f2 * h2 - d1 * e2 * e2 * i1 + d1 * e2 * f1 * h2 - 2 * d1 * e2 * f2 * h1...
	- d2 * e1 * e1 * i2 + d2 * e1 * e2 * i1 - 2 * d2 * e1 * f1 * h2 + d2 * e1 * f2 * h1...
	+ d2 * e2 * f1 * h1;

C4 = -a1 * a1 * j2 * j2 + 2 * a1 * a2 * j1 * j2 - 4 * a1 * b1 * i2 * j2...
    + 2 * a1 * b2 * i1 * j2 + 2 * a1 * b2 * i2 * j1 - 4 * a1 * d1 * h2 * j2...
	- 2 * a1 * d1 * i2 * i2 + 2 * a1 * d2 * h1 * j2 + 2 * a1 * d2 * h2 * j1...
	+ 2 * a1 * d2 * i1 * i2 + a1 * e1 * g2 * j2 + a1 * e2 * g1 * j2 - 2 * a1 * e2 * g2 * j1...
	+ a1 * f1 * f2 * j2 + a1 * f1 * g2 * i2 - a1 * f2 * f2 * j1 + a1 * f2 * g1 * i2...
	- 2 * a1 * f2 * g2 * i1 + a1 * g1 * g2 * h2 - a1 * g2 * g2 * h1 - a2 * a2 * j1 * j1...
	+ 2 * a2 * b1 * i1 * j2 + 2 * a2 * b1 * i2 * j1 - 4 * a2 * b2 * i1 * j1...
	+ 2 * a2 * d1 * h1 * j2 + 2 * a2 * d1 * h2 * j1 + 2 * a2 * d1 * i1 * i2...
	- 4 * a2 * d2 * h1 * j1 - 2 * a2 * d2 * i1 * i1 - 2 * a2 * e1 * g1 * j2...
	+ a2 * e1 * g2 * j1 + a2 * e2 * g1 * j1 - a2 * f1 * f1 * j2 + a2 * f1 * f2 * j1...
	- 2 * a2 * f1 * g1 * i2 + a2 * f1 * g2 * i1 + a2 * f2 * g1 * i1 - a2 * g1 * g1 * h2...
	+ a2 * g1 * g2 * h1 - 2 * b1 * b1 * h2 * j2 - b1 * b1 * i2 * i2 + 2 * b1 * b2 * h1 * j2...
	+ 2 * b1 * b2 * h2 * j1 + 2 * b1 * b2 * i1 * i2 - 4 * b1 * d1 * h2 * i2...
	+ 2 * b1 * d2 * h1 * i2 + 2 * b1 * d2 * h2 * i1 + b1 * e1 * f2 * j2 + b1 * e1 * g2 * i2...
	+ b1 * e2 * f1 * j2 - 2 * b1 * e2 * f2 * j1 + b1 * e2 * g1 * i2 - 2 * b1 * e2 * g2 * i1...
	+ b1 * f1 * f2 * i2 + b1 * f1 * g2 * h2 - b1 * f2 * f2 * i1 + b1 * f2 * g1 * h2...
	- 2 * b1 * f2 * g2 * h1 - 2 * b2 * b2 * h1 * j1 - b2 * b2 * i1 * i1...
	+ 2 * b2 * d1 * h1 * i2 + 2 * b2 * d1 * h2 * i1 - 4 * b2 * d2 * h1 * i1...
	- 2 * b2 * e1 * f1 * j2 + b2 * e1 * f2 * j1 - 2 * b2 * e1 * g1 * i2 + b2 * e1 * g2 * i1...
	+ b2 * e2 * f1 * j1 + b2 * e2 * g1 * i1 - b2 * f1 * f1 * i2 + b2 * f1 * f2 * i1...
	- 2 * b2 * f1 * g1 * h2 + b2 * f1 * g2 * h1 + b2 * f2 * g1 * h1 - d1 * d1 * h2 * h2...
	+ 2 * d1 * d2 * h1 * h2 + d1 * e1 * e2 * j2 + d1 * e1 * f2 * i2 + d1 * e1 * g2 * h2...
	- d1 * e2 * e2 * j1 + d1 * e2 * f1 * i2 - 2 * d1 * e2 * f2 * i1 + d1 * e2 * g1 * h2...
	- 2 * d1 * e2 * g2 * h1 + d1 * f1 * f2 * h2 - d1 * f2 * f2 * h1 - d2 * d2 * h1 * h1...
	- d2 * e1 * e1 * j2 + d2 * e1 * e2 * j1 - 2 * d2 * e1 * f1 * i2 + d2 * e1 * f2 * i1...
	- 2 * d2 * e1 * g1 * h2 + d2 * e1 * g2 * h1 + d2 * e2 * f1 * i1 + d2 * e2 * g1 * h1...
	- d2 * f1 * f1 * h2 + d2 * f1 * f2 * h1;

C3 = -2 * a1 * b1 * j2 * j2 + 2 * a1 * b2 * j1 * j2 - 4 * a1 * d1 * i2 * j2...
    + 2 * a1 * d2 * i1 * j2 + 2 * a1 * d2 * i2 * j1 + a1 * f1 * g2 * j2 + a1 * f2 * g1 * j2...
	- 2 * a1 * f2 * g2 * j1 + a1 * g1 * g2 * i2 - a1 * g2 * g2 * i1 + 2 * a2 * b1 * j1 * j2...
	- 2 * a2 * b2 * j1 * j1 + 2 * a2 * d1 * i1 * j2 + 2 * a2 * d1 * i2 * j1...
	- 4 * a2 * d2 * i1 * j1 - 2 * a2 * f1 * g1 * j2 + a2 * f1 * g2 * j1 + a2 * f2 * g1 * j1...
	- a2 * g1 * g1 * i2 + a2 * g1 * g2 * i1 - 2 * b1 * b1 * i2 * j2 + 2 * b1 * b2 * i1 * j2...
	+ 2 * b1 * b2 * i2 * j1 - 4 * b1 * d1 * h2 * j2 - 2 * b1 * d1 * i2 * i2...
	+ 2 * b1 * d2 * h1 * j2 + 2 * b1 * d2 * h2 * j1 + 2 * b1 * d2 * i1 * i2...
	+ b1 * e1 * g2 * j2 + b1 * e2 * g1 * j2 - 2 * b1 * e2 * g2 * j1 + b1 * f1 * f2 * j2...
	+ b1 * f1 * g2 * i2 - b1 * f2 * f2 * j1 + b1 * f2 * g1 * i2 - 2 * b1 * f2 * g2 * i1...
	+ b1 * g1 * g2 * h2 - b1 * g2 * g2 * h1 - 2 * b2 * b2 * i1 * j1 + 2 * b2 * d1 * h1 * j2...
	+ 2 * b2 * d1 * h2 * j1 + 2 * b2 * d1 * i1 * i2 - 4 * b2 * d2 * h1 * j1...
	- 2 * b2 * d2 * i1 * i1 - 2 * b2 * e1 * g1 * j2 + b2 * e1 * g2 * j1 + b2 * e2 * g1 * j1...
	- b2 * f1 * f1 * j2 + b2 * f1 * f2 * j1 - 2 * b2 * f1 * g1 * i2 + b2 * f1 * g2 * i1...
	+ b2 * f2 * g1 * i1 - b2 * g1 * g1 * h2 + b2 * g1 * g2 * h1 - 2 * d1 * d1 * h2 * i2...
	+ 2 * d1 * d2 * h1 * i2 + 2 * d1 * d2 * h2 * i1 + d1 * e1 * f2 * j2 + d1 * e1 * g2 * i2...
	+ d1 * e2 * f1 * j2 - 2 * d1 * e2 * f2 * j1 + d1 * e2 * g1 * i2 - 2 * d1 * e2 * g2 * i1...
	+ d1 * f1 * f2 * i2 + d1 * f1 * g2 * h2 - d1 * f2 * f2 * i1 + d1 * f2 * g1 * h2...
	- 2 * d1 * f2 * g2 * h1 - 2 * d2 * d2 * h1 * i1 - 2 * d2 * e1 * f1 * j2...
	+ d2 * e1 * f2 * j1 - 2 * d2 * e1 * g1 * i2 + d2 * e1 * g2 * i1 + d2 * e2 * f1 * j1...
	+ d2 * e2 * g1 * i1 - d2 * f1 * f1 * i2 + d2 * f1 * f2 * i1 - 2 * d2 * f1 * g1 * h2...
	+ d2 * f1 * g2 * h1 + d2 * f2 * g1 * h1;

C2 = -2 * a1 * d1 * j2 * j2 + 2 * a1 * d2 * j1 * j2 + a1 * g1 * g2 * j2...
    - a1 * g2 * g2 * j1 + 2 * a2 * d1 * j1 * j2 - 2 * a2 * d2 * j1 * j1...
	- a2 * g1 * g1 * j2 + a2 * g1 * g2 * j1 - b1 * b1 * j2 * j2 + 2 * b1 * b2 * j1 * j2...
	- 4 * b1 * d1 * i2 * j2 + 2 * b1 * d2 * i1 * j2 + 2 * b1 * d2 * i2 * j1...
	+ b1 * f1 * g2 * j2 + b1 * f2 * g1 * j2 - 2 * b1 * f2 * g2 * j1 + b1 * g1 * g2 * i2...
	- b1 * g2 * g2 * i1 - b2 * b2 * j1 * j1 + 2 * b2 * d1 * i1 * j2 + 2 * b2 * d1 * i2 * j1...
	- 4 * b2 * d2 * i1 * j1 - 2 * b2 * f1 * g1 * j2 + b2 * f1 * g2 * j1 + b2 * f2 * g1 * j1...
	- b2 * g1 * g1 * i2 + b2 * g1 * g2 * i1 - 2 * d1 * d1 * h2 * j2...
	- d1 * d1 * i2 * i2 + 2 * d1 * d2 * h1 * j2 + 2 * d1 * d2 * h2 * j1...
	+ 2 * d1 * d2 * i1 * i2 + d1 * e1 * g2 * j2 + d1 * e2 * g1 * j2 - 2 * d1 * e2 * g2 * j1...
	+ d1 * f1 * f2 * j2 + d1 * f1 * g2 * i2 - d1 * f2 * f2 * j1 + d1 * f2 * g1 * i2...
	- 2 * d1 * f2 * g2 * i1 + d1 * g1 * g2 * h2 - d1 * g2 * g2 * h1 - 2 * d2 * d2 * h1 * j1...
	- d2 * d2 * i1 * i1 - 2 * d2 * e1 * g1 * j2 + d2 * e1 * g2 * j1 + d2 * e2 * g1 * j1...
	- d2 * f1 * f1 * j2 + d2 * f1 * f2 * j1 - 2 * d2 * f1 * g1 * i2 + d2 * f1 * g2 * i1...
	+ d2 * f2 * g1 * i1 - d2 * g1 * g1 * h2 + d2 * g1 * g2 * h1;

C1 = -2 * b1 * d1 * j2 * j2 + 2 * b1 * d2 * j1 * j2 + b1 * g1 * g2 * j2 - b1 * g2 * g2 * j1...
    + 2 * b2 * d1 * j1 * j2 - 2 * b2 * d2 * j1 * j1 - b2 * g1 * g1 * j2 + b2 * g1 * g2 * j1...
	- 2 * d1 * d1 * i2 * j2 + 2 * d1 * d2 * i1 * j2 + 2 * d1 * d2 * i2 * j1...
	+ d1 * f1 * g2 * j2 + d1 * f2 * g1 * j2 - 2 * d1 * f2 * g2 * j1 + d1 * g1 * g2 * i2...
	- d1 * g2 * g2 * i1 - 2 * d2 * d2 * i1 * j1 - 2 * d2 * f1 * g1 * j2 + d2 * f1 * g2 * j1...
	+ d2 * f2 * g1 * j1 - d2 * g1 * g1 * i2 + d2 * g1 * g2 * i1;

C0 = -d1 * d1 * j2 * j2 + 2 * d1 * d2 * j1 * j2 + d1 * g1 * g2 * j2...
    - d1 * g2 * g2 * j1 - d2 * d2 * j1 * j1 - d2 * g1 * g1 * j2 + d2 * g1 * g2 * j1;

mypoly = [C8 C7 C6 C5 C4 C3 C2 C1 C0];
x1 = roots(mypoly);

for i=1:8
    L1 = a1*x1(i)^2 + b1*x1(i) + d1 ;
    M1 = e1*x1(i)^2 + f1*x1(i) + g1 ;
    N1 = h1*x1(i)^2 + i1*x1(i) + j1 ;
    L2 = a2*x1(i)^2 + b2*x1(i) + d2 ;
    M2 = e2*x1(i)^2 + f2*x1(i) + g2 ;
    N2 = h2*x1(i)^2 + i2*x1(i) + j2 ;
    
    x2Vector = inv([0, L1, M1;0, L2, M2;L1, M1, N1])*[-N1;-N2;0];
    x2(i) = x2Vector(3);
    
end

end