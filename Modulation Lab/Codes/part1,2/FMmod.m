function [S,T]=FMmod(s,t,Fc,df)
Ts=t(2); ss=s*2-1; Tm=t(numel(t));
phi=cumsum(ss)*Ts; S=sin(2*pi*Fc*t+2*pi*df*phi); T=t;
 end