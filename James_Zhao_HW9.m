clc;clear;
% reverse analysis--Cincinnati Milacron T3-776

%given inputs
S6 = 6;
P_tool_F = [55;33;23];
P_tool_6 = [5;3;7];
S6_F = [1;0;0];
a67_F = [0;sqrt(2)/2;sqrt(2)/2];

angles = reverseAnalysis(S6,P_tool_F,P_tool_6,S6_F,a67_F);  %solve angles using reverse anaylsis

%printing the results
fprintf("phi1      theta2      theta3      theta4      theta5      theta6\n")
for i =  1:length(angles(:,1))
    for j = 1:length(angles(1,:))
        fprintf("%0.4f    ",angles(i,j))
    end
    fprintf("\n")
end

%check for forward analysis
fprintf("\n\nCheck forward analysis:")
for i = 1:length(angles(:,1))
    [PtoolF,S6F,a67F] = forwardAnalysis("T3-776",[P_tool_6;1],angles(i,:),S6);
    fprintf("\n\nSolution set %d tool position:\n",i);
    fprintf("P_tool_F = %0.5f    %0.5f    %0.5f\n",PtoolF(1),PtoolF(2),PtoolF(3))
    fprintf("S6 in Fixed = %0.5f    %0.5f    %0.5f\n",S6F(1),S6F(2),S6F(3))
    fprintf("a67 in Fixed = %0.5f    %0.5f    %0.5f\n",a67F(1),a67F(2),a67F(3))
end



