function [s1,t1,s2,t2]=AMnoise(s,t,Fc,Ts,SNR)
[SS,T]=AMmod(s,t,Fc); S=awgn(SS,SNR,'measured');
[s1,t1]=Envelope_detector(S,T);
figure;
s2=amdemod(S,Fc,1/Ts,-pi/2);
t2=t1;
plot(t2,amdemod(S,Fc,1/Ts,-pi/2))
title('amdemod')

end
