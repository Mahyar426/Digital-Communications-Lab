function [s1,t1,s2,t2]=FMnoise(s,t,Fc,Ts,df,SNR)
[SS,T]=FMmod(s,t,Fc,df); S=awgn(SS,SNR,'measured');
[s1,t1]=FMdmod(S,T,Fc,df);
figure;
s2=fmdemod(S,Fc,1/Ts,df,-pi/2);
t2=t1;
plot(T,fmdemod(S,Fc,1/Ts,df,-pi/2))
title('fmdemod')

end
