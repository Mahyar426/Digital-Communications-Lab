
function [S,T]=AMmod(s,t,Fc)
Ts=t(2); Tm=t(numel(t)); k=0;
if Ts>1/(10*Fc)
msgbox('Fc must be between 2*F & 0.1/Ts','error'); S=0; T=0;
else
C=sin(2*pi*Fc*[0:Ts:Tm]); S=s.*C; T=t;
end
end
