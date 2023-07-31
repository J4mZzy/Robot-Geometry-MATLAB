clc; clear %clear worspace and command window

%% problem 2.3
T1 = [sqrt(3)/2, 0, 0.5, 20; 0, -1, 0, 0; 0.5, 0, -sqrt(3)/2, 0; 0, 0, 0, 1]; %A to B 
T2 = [sqrt(2)/2, sqrt(2)/2, 0, 0; sqrt(2)/2, -sqrt(2)/2, 0, 0; 0, 0, -1, 10; 0, 0, 0, 1]; %A to C
T3 = [1, 0, 0, 0; 0, sqrt(3)/2, 0.5, 10; 0, -0.5, sqrt(3)/2, 0; 0, 0, 0, 1]; %B to D
T4 = T2*inv(T1)*inv(T3); %D to C
disp('the Transformation Matrix is:')
disp(T4)

P1D = [20,-30,5,1]'; %this point is defined in the D corrodinate system
P1A = inv(T1)*inv(T3)*P1D; %Transformation needs to be from D to A   
disp('the P1 in A is:')
disp(P1A)
P1B = inv(T3)*P1D; %Transformation needs to be from D to B
disp('the P1 in B is:')
disp(P1B)
P1C = T4*P1D; %Transformation needs to be from D to C
disp('the P1 in C is:')
disp(P1C)


%% problem 2.4
m1 = unitVector([2,4,7]); %unit vector
P2 = [3, 4, -2, 1]'; %point passed through
T5 = [1, 0, 0, P2(1); 0, 1, 0, P2(2); 0, 0, 1, P2(3); 0, 0, 0, 1]; %Translation from C to A
T6 = transformationMatrix(60,m1,[0,0,0]); %Rotation from D to C   ********* IMPORTANT TRANSFORMATION MATRIX FOR ROTATING AROUND VECTOR m
T7 = transformationMatrix(0,[0,0,0],-P2);
T8 = T5*T6*T7; %Resultatnt Transfomration Matrix from B to A
disp('the Transformation Matrix is:')
disp(T8)


%% problem 2.8 (Same problem)
P3 = [10, 20, 10, 1]'; %point passes thorugh
m2 = unitVector([2,4,6]); %unit vector
T9 = transformationMatrix(0,[0,0,0],P3); %Translation from D to A 
T10 = transformationMatrix(30,[1,0,0],[0,0,0]);
T11 = transformationMatrix(0,[0,0,0],-P3); %Translation from B to E
T12 = T9*T10*T11; %B to A
T13 = transformationMatrix(60,m2,[0,0,0]); %C to A
T14 = inv(T12)*T13; %C to B

disp('the Transformation Matrix is:')
disp(T14)


