
 function [s,t]=Envelope_detector(S,T)
p=abs(hilbert(S))
%[p,locations]=findpeaks(S)
figure;
s=p;
t=T;
plot(T,p)
%plot(locations,p)
title('Envelope detector')
 end