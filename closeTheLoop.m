function [a71,S7,S1,alpha,theta,gamma] = closeTheLoop(P_f,P_6,S6_f,a67_f)
%close-the-loop function
%inputs are P in 6, P in fixed, S6, and a67 (all vectors)
%outputs a71, S7, S1, alpha71, theta7, gamma1 (all scalars)

P = P_f - dot(P_6,[1,0,0])*a67_f - dot(P_6,[0,1,0])*cross(S6_f,a67_f) - dot(P_6,[0,0,1])*S6_f;

S1_f = [0;0;1]; %S1 vector
S7_f = cross(a67_f,S6_f);  %S7 vector
c71 = dot(S7_f,S1_f);

%% cases of S1 and S7 parallel or not parallel
%parallel
if c71 == 1 || c71 == -1
    S7 = 0; %S7
    s71 = 0;
    S1 = dot(-P,S1_f); %S1
    alpha = atan2d(s71,c71);    %alpha71 angle
    a71 = norm(-(P+S1*S1_f));

    %collinear case
    if a71 == 0
        theta = 0;
        a71_f = a67_f;
        %not collinear, just parallel
    else
        a71_f = -(P+S1*S1_f)/a71;
        c7 = dot(a67_f, a71_f);
        s7 = dot(cross(a67_f, a71_f),S7_f);
        theta = atan2d(s7,c7);  %theta7 angle
    end
        cgamma = dot(a71_f,[1;0;0]);
        sgamma = dot(cross(a71_f, [1;0;0]),S1_f);

        gamma = atan2d(sgamma,cgamma);  %gamma angle

    %not parallel
else
    a71_f = unitVector(cross(S7_f,S1_f));

    s71 = dot(cross(S7_f,S1_f),a71_f);

    c7 = dot(a67_f, a71_f);
    s7 = dot(cross(a67_f, a71_f),S7_f);

    cgamma = dot(a71_f,[1;0;0]);
    sgamma = dot(cross(a71_f, [1;0;0]),S1_f);

    %%the angles

    alpha = atan2d(s71,c71); %alpha71 angle
    theta = atan2d(s7,c7); %theta7 angle
    gamma = atan2d(sgamma,cgamma); %gamma1 angle
   
    S7 = dot(cross(S1_f,P),a71_f)/s71; %S7
    S1 = dot(cross(P,S7_f),a71_f)/s71; %S1
    a71 = dot(cross(P,S1_f),S7_f)/s71; %a71
end

end