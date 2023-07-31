function [P2,S6,a67] = forwardAnalysis(robot,P1,angles,S6_offset)
%forward analysis of Cincinnati Milacron T3-776 robot
%phi1 is the first number in angles, and then theta2,theta3... 
switch robot
    case "T3-776"
 T1 = transformationMatrix(angles(1),[0,0,1],[0,0,0]); %1 to F
 T2 = transformationMatrixForward(angles(2),90,0,0); %2 to 1
 T3 = transformationMatrixForward(angles(3),0,44,0); %3 to 2
 T4 = transformationMatrixForward(angles(4),90,0,55); %4 to 3
 T5 = transformationMatrixForward(angles(5),61,0,0); %5 to 4
 T6 = transformationMatrixForward(angles(6),61,0,S6_offset); %6 to 5
 
 T = T1*T2*T3*T4*T5*T6;%6 to F
 P2 = T*P1; %P tool in fixed coordinate system
 S6 = T(1:3,3); %third column is S6
 a67 = T(1:3,1); %first column is the a67

    case "Puma"
 T1 = transformationMatrix(angles(1),[0,0,1],[0,0,0]); %1 to F
 T2 = transformationMatrixForward(angles(2),90,0,5.9); %2 to 1
 T3 = transformationMatrixForward(angles(3),0,17,0); %3 to 2
 T4 = transformationMatrixForward(angles(4),270,0.8,17); %4 to 3
 T5 = transformationMatrixForward(angles(5),90,0,0); %5 to 4
 T6 = transformationMatrixForward(angles(6),90,0,S6_offset); %6 to 5
 
 T = T1*T2*T3*T4*T5*T6;%6 to F
 P2 = T*P1; %P tool in fixed coordinate system
 S6 = T(1:3,3); %third column is S6
 a67 = T(1:3,1); %first column is the a67

    case "G.E.P60"
 T1 = transformationMatrix(angles(1),[0,0,1],[0,0,0]); %1 to F
 T2 = transformationMatrixForward(angles(2),270,0,0); %2 to 1
 T3 = transformationMatrixForward(angles(3),0,70,0); %3 to 2
 T4 = transformationMatrixForward(angles(4),0,90,9.8); %4 to 3
 T5 = transformationMatrixForward(angles(5),270,0,14.5); %5 to 4
 T6 = transformationMatrixForward(angles(6),90,0,S6_offset); %6 to 5
 
 T = T1*T2*T3*T4*T5*T6;%6 to F
 P2 = T*P1; %P tool in fixed coordinate system
 S6 = T(1:3,3); %third column is S6
 a67 = T(1:3,1); %first column is the a67
end
 
end