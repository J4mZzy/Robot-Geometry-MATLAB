clc; clear; %clear workspace and command window
%% Main function for the 3 robot forward analysis "Puma", "G.E.P60", and, "T3-776"
P1 = [5,3,9,1]'; % P in the sixth coordinate system (arbituary point)
S6_offset = 4; %S6 is 6 inches for T3, 15.24 for GE, 4 for puma
angles = [5/4*180,5/6*180,-180/3,180/4,180/3,-180/6]; %list of phi and theta angles (arbiturary angles)
[P2,S6F,a67F] = forwardAnalysis("G.E.P60",P1,angles,S6_offset); %P in fixed coordinate system,S6 in fixed, and a67 in fixed 
disp("P tool in the fixed coordinate system is (in inches):")
disp(P2)
disp("S6 in fixed coordinate system is:")
disp(S6F)
disp("a67 in fixed coordinate system is:")
disp(a67F)

