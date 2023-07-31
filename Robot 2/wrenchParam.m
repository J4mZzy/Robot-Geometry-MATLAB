function [ma,mt,f_sum,m0_sum] = wrenchParam(S,S0,h,magf)
%a dyname is defined as [f m0]= [f 0] + [0 m0] 
%the wrench representation is [f m0] = [f mt] + [0 ma]
%inputs are parameters of the wrench: magnitude of force,line of action of force, pitch
%outputs the dyname and wrench representations

S_norm = norm(S);
S = S/S_norm; %unit-vectorize S
f_sum = magf*S; %force vector
ma = h*f_sum; 
m0_sum = magf*(S0/S_norm+h*S); %total moment (S0 is unitized using S's norm)
mt = m0_sum-ma;
end