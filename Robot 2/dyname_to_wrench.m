function [ma,mt,magf,S,S0L,h] = dyname_to_wrench(f_sum,m0_sum)
%a dyname is defined as [f m0]= [f 0] + [0 m0] 
%the wrench representation is [f m0] = [f mt] + [0 ma]
%also outputs force magnitude along the wrench, the wrench line of action, and pitch

magf = norm(f_sum); %magnitude of force
S = f_sum/magf; %direction of force

ma = dot(m0_sum,S)*S;
mt = m0_sum - ma;

h = dot(f_sum,m0_sum)/dot(f_sum,f_sum); %pitch equation
S0L = mt/magf; %moment of line
end